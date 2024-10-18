//
//  FetchMessageUseCase.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import RxSwift

final class FetchChatUseCase: Domain.FetchChatsUseCase {

    private let chatRepository: ChatRepository
    
    init(chatRepository: ChatRepository) {
        self.chatRepository = chatRepository
    }
    
    func execute(input: String) -> RxSwift.Observable<Array<Domain.Chat>> {
        chatRepository.fetchChat(for: input)
    }
}
