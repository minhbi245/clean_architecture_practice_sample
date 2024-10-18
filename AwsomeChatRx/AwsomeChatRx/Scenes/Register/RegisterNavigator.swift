// 
//  RegisterNavigator.swift
//  AwsomeChatRx
//
//  Created by khanhnvm on 12/7/24.
//

import UIKit

protocol RegisterNavigatorType: NavigatorType {
}

protocol RMakeegister {
    func makeegister() -> RegisterNavigatorType
}

extension RMakeegister {
    func makeegister() -> RegisterNavigatorType {
        return RegisterNavigator()
    }
}

struct RegisterNavigator: RegisterNavigatorType {
    func makeViewController() -> UIViewController {
        let viewModel = RegisterViewModel(navigator: self)
        let viewController = RegisterViewController(viewModel: viewModel)
        return viewController
    }
}
