//
//  LoginViewModel.swift
//  AwsomeChatRx
//
//  Created by khanhnvm on 12/7/24.
//

import UIKit
import RxSwift
import RxCocoa
import Domain
import Platform

class LoginViewModel {
    var disposeBag = DisposeBag()
    let loginUseCaseProvider: LoginUserCaseProvider
    init(loginUseCaseProvider: LoginUserCaseProvider) {
        self.loginUseCaseProvider = loginUseCaseProvider
    }
}

extension LoginViewModel: ViewModelType {
    func transform(input: Input) -> Output {
        
        let loginResult = input.loginTrigger.withLatestFrom(Observable.combineLatest(input.email, input.password))
            .flatMapLatest { [unowned self] (email, password) in
                return self.loginUseCaseProvider.makeLoginUseCase().execute(input: (email: email, password: password))
                    .map { Result<Domain.User, Error>.success($0) }
                    .catch { error -> Observable<Result<Domain.User, Error>> in
                        return .just(.failure(error))
                    }
                    .asDriver(onErrorDriveWith: .empty())
            }
        return .init(loginResult: loginResult.asdr)
    }
}

extension LoginViewModel {
    struct Input {
        let email: Observable<String>
        let password: Observable<String>
        let loginTrigger: Observable<Void>
    }
    
    struct Output {
        let loginResult: Driver<Result<User, Error>>
    }
}
