//
//  UseCaseProvider.swift
//  Domain
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import Foundation

public protocol UseCaseProvider {
    func makeLoginUseCase() -> any LoginUseCase
    func makeRegisterUseCase() -> any RegisterUseCase
}
