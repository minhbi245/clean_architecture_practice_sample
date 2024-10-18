//
//  SendMessageUseCase.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import RxSwift

final class SendMessageUseCase: Domain.SendMessageUseCase {
  
    

    private let chatRepository: Domain.ChatRepository

    init(chatRepository: Domain.ChatRepository) {
        self.chatRepository = chatRepository
    }
    
    func execute(input: (chatId: String, message: any Domain.ChatMessage)) -> RxSwift.Observable<()> {
        return chatRepository.sendMessage(chatId: input.chatId, message: input.message)
    }
}
