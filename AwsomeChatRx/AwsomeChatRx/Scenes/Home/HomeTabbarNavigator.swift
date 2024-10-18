//
//  HomeNavigator.swift
//  AwsomeChatRx
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import UIKit
import Domain
import RxSwift
struct HomeNavigator: NavigatorType {
    let chatUseCaseProvider: ChatUseCaseProvider
    func makeViewController() -> UIViewController {
        let viewModel = HomeTabbarViewModel(chatUseCase: chatUseCaseProvider)
        let viewController = HomeTabbarController(viewModel: viewModel)
        return viewController
    }
}
