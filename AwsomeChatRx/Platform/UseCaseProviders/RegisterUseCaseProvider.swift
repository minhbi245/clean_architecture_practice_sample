//
//  RegisterUseCaseProvider.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import RxSwift

public class RegisterUseCaseProvider: Domain.RegisterUseCaseProvider {

    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    public func registerUseCase() -> any Domain.RegisterUseCase {
        return RegisterUseCase(userRepository: userRepository)
    }
}
