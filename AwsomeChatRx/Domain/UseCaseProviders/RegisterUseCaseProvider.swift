//
//  RegisterUseCaseProvider.swift
//  Domain
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation

public protocol RegisterUseCaseProvider {
    func registerUseCase() -> any RegisterUseCase
}
