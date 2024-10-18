//
//  LoginUseCaseProvider.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import RxSwift

public final class LoginUseCaseProvider: Domain.LoginUserCaseProvider {
    private let repository: UserRepository
    
    public init(repository: UserRepository) {
        self.repository = repository
    }
    
    public func makeLoginUseCase() -> any Domain.LoginUseCase {
        return LoginUseCase(userRepository: repository)
    }
}
