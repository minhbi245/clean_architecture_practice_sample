// 
//  LoginNavigator.swift
//  AwsomeChatRx
//
//  Created by khanhnvm on 12/7/24.
//

import UIKit
import Domain

protocol LoginNavigatorType: NavigatorType {
}

struct LoginNavigator: LoginNavigatorType {
    let loginUserCaseProvider: LoginUserCaseProvider
    func makeViewController() -> UIViewController {
        let viewModel = LoginViewModel(loginUseCaseProvider: loginUserCaseProvider)
        let viewController = LoginViewController(viewModel: viewModel)
        return viewController
    }
}
