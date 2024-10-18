//
//  ChatRemoteDataSource.swift
//  Domain
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import RxSwift

public protocol ChatRemoteDataSource {
    func fetchChats(for userId: String) -> Observable<[Chat]>
    func sendMessage(chatId: String, message: ChatMessage) -> Observable<Void>
    func observeNewMessages(in chatId: String) -> Observable<ChatMessage>
}
