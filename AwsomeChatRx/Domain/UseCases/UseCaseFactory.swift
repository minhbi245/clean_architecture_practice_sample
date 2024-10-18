//
//  UseCase.swift
//  Domain
//
//  Created by khanhnvm on 12/7/24.
//

import Foundation
import RxSwift

public protocol UseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(input: Input) -> Observable<Output>
}

public protocol LoginUseCase: UseCase where Input == (email: String, password: String), Output == User {}
public protocol RegisterUseCase: UseCase where Input == (email: String, password: String, displayName: String), Output == User {}
public protocol FetchChatsUseCase: UseCase where Input == String, Output == [Chat] {}
public protocol SendMessageUseCase: UseCase where Input == (chatId: String, message: ChatMessage), Output == Void {}
public protocol ObserveNewMessagesUseCase: UseCase where Input == String, Output == ChatMessage {}
