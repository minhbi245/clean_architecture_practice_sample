//
//  RegisterUseCase.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import RxSwift

class RegisterUseCase: Domain.RegisterUseCase {

    private let userRepository: Domain.UserRepository
    
    init(userRepository: Domain.UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(input: (email: String, password: String, displayName: String)) -> RxSwift.Observable<any Domain.User> {
        userRepository.register(email: input.email, password: input.password, displayName: input.displayName)
    }
}
