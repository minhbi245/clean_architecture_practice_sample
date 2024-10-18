//
//  SendMessageRepository.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import RxSwift

public final class ChatRepository: Domain.ChatRepository {
    private let chatRemoteDataSource: ChatRemoteDataSource

    public init(chatRemoteDataSource: ChatRemoteDataSource) {
        self.chatRemoteDataSource = chatRemoteDataSource
    }

    public func fetchChat(for userId: String) -> RxSwift.Observable<[Domain.Chat]> {
        return chatRemoteDataSource.fetchChats(for: userId)
    }

    public func sendMessage(chatId: String, message: Domain.ChatMessage) -> RxSwift.Observable<Void> {
        return chatRemoteDataSource.sendMessage(chatId: chatId, message: message)
    }

    public func observeNewMessages(in chatId: String) -> RxSwift.Observable< Domain.ChatMessage> {
        return chatRemoteDataSource.observeNewMessages(in: chatId)
    }
}
