//
//  Application.swift
//  AwsomeChatRx
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import UIKit
import Platform

class Application {
    private static var instance: Application?
    private static let lock = NSLock()
    
    private init() {}

    // Lazy Initialize
    static var shared: Application {
        if instance == nil {
            lock.lock()
            defer { lock.unlock() }
            if instance == nil {
                instance = Application()
            }
        }
        return instance!
    }
    
    func configureLoginInterface(in window: UIWindow) {
        let loginRemoteDataSource = UserRemoteDataSource()
        let userRepository = UserRepository(remoteDataSource: loginRemoteDataSource)
        let service = LoginUseCaseProvider(repository: userRepository)
        let navigator = LoginNavigator(loginUserCaseProvider: service)
        let viewController = navigator.makeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()    }

    func configureMainInterface(in window: UIWindow) {
        let chatRemoteDataSource = ChatRemoteDataSource()
        let chatRepository = ChatRepository(chatRemoteDataSource: chatRemoteDataSource)
        let service = ChatUseCaseProvider(chatRepository: chatRepository)
        let navigator = HomeNavigator(chatUseCaseProvider: service)
        let viewController = navigator.makeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
