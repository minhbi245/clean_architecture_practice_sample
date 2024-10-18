//
//  AuthenticateUseCaseProvider.swift
//  Domain
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import Foundation
import RxSwift

public protocol LoginUserCaseProvider {
    func makeLoginUseCase() -> any LoginUseCase
}
