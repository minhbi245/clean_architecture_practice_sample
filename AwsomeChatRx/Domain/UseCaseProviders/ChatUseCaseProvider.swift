//
//  ChatUseCaseProvider.swift
//  Domain
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
public protocol ChatUseCaseProvider {
    func makeFetchChatUseCase() -> any FetchChatsUseCase
    func makeSendMessageUseCase() -> any SendMessageUseCase
}
