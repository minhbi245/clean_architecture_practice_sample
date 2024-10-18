//
//  AuthenticateUseCase.swift
//  Platform
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import Foundation
import Domain
import RxSwift

class LoginUseCase: Domain.LoginUseCase {

    let userRepository: UserRepository
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute(input: (email: String, password: String)) -> RxSwift.Observable<Domain.User> {
        userRepository.login(email: input.email, password: input.password)
    }
}
