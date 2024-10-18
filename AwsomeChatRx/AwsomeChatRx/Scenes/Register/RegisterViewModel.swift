// 
//  RegisterViewModel.swift
//  AwsomeChatRx
//
//  Created by khanhnvm on 12/7/24.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

class RegisterViewModel {
    
    var disposeBag = DisposeBag()
    let registerProvider: RegisterUseCaseProvider

    init(registerProvider: RegisterUseCaseProvider) {
        self.registerProvider = registerProvider
    }
}

extension RegisterViewModel: ViewModelType {
    func transform(input: Input) -> Output {

        return .init()
    }
}

extension RegisterViewModel {
    struct Input {
        let email: Driver<String>
        let password: Driver<String>
        let displayName: Driver<String>
        let registerTrigger: Driver<Void>
    }
    
    struct Output {
        let result: Driver<Result<Domain.User, Error>>
    }
}
