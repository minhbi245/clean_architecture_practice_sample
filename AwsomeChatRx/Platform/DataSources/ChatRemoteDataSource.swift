//
//  ChatRemoteDataSource.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import RxSwift
import FirebaseDatabase

public final class ChatRemoteDataSource: Domain.ChatRemoteDataSource {
    private let db = Database.database().reference()

    public init() {}

    public func fetchChats(for userId: String) -> RxSwift.Observable<[Domain.Chat]> {
        return Observable.create { observer in
            self.db.child("chats").queryOrdered(byChild: "participants/\(userId)").queryEqual(toValue: true).observeSingleEvent(of: .value) { snapshot in
                guard let chatDictionaries = snapshot.value as? [String: [String: Any]] else {
                    observer.onNext([])
                    observer.onCompleted()
                    return
                }

                let chats = chatDictionaries.compactMap { (key, value) -> Chat? in
                    do {
                        var chatData = value
                        chatData["id"] = key
                        let jsonData = try JSONSerialization.data(withJSONObject: chatData)
                        return try JSONDecoder().decode(Chat.self, from: jsonData)
                    } catch {
                        print("Error decoding chat: \(error)")
                        return nil
                    }
                }
                observer.onNext(chats)
                observer.onCompleted()
            } withCancel: { error in
                observer.onError(error)
            }

            return Disposables.create()
        }
    }

    public func sendMessage(chatId: String, message: Domain.ChatMessage) -> RxSwift.Observable<Void> {
        return Observable.create { observer in
            do {
                let messageRef = self.db.child("chats").child(chatId).child("messages").childByAutoId()
                let messageData = try JSONEncoder().encode(message)
                let messageDictionary = try JSONSerialization.jsonObject(with: messageData, options: []) as? [String: Any] ?? [:]

                messageRef.setValue(messageDictionary) { error, _ in
                    if let error = error {
                        observer.onError(error)
                    } else {
                        observer.onNext(())
                        observer.onCompleted()
                    }
                }
            } catch {
                observer.onError(error)
            }

            return Disposables.create()
        }
    }

    public func observeNewMessages(in chatId: String) -> RxSwift.Observable<Domain.ChatMessage> {
        return Observable.create { observer in
            let handle = self.db.child("chats").child(chatId).child("messages").observe(.childAdded) { snapshot in
                guard let messageDictionary = snapshot.value as? [String: Any] else { return }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: messageDictionary)
                    let message = try JSONDecoder().decode(ChatMessage.self, from: jsonData)
                    observer.onNext(message)
                } catch {
                    print("Error decoding message: \(error)")
                }
            } withCancel: { error in
                observer.onError(error)
            }

            return Disposables.create {
                self.db.child("chats").child(chatId).child("messages").removeObserver(withHandle: handle)
            }
        }
    }
}
