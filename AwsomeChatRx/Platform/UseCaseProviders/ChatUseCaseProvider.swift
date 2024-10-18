//
//  ChatUseCaseProvider.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import RxSwift

public class ChatUseCaseProvider: Domain.ChatUseCaseProvider {

    private let chatRepository: ChatRepository

    public init(chatRepository: ChatRepository) {
        self.chatRepository = chatRepository
    }

    public func makeFetchChatUseCase() -> any Domain.FetchChatsUseCase {
        return FetchChatUseCase(chatRepository: chatRepository)
    }
    
    public func makeSendMessageUseCase() -> any Domain.SendMessageUseCase {
        return SendMessageUseCase(chatRepository: chatRepository)
    }
}
