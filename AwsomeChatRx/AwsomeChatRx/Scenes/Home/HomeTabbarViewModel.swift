//
//  HomeViewModel.swift
//  AwsomeChatRx
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import RxSwift
import RxCocoa
import UIKit
import Domain

class HomeTabbarViewModel: ViewModelType {
    private let chatUseCase: ChatUseCaseProvider
    private let disposeBag = DisposeBag()
    
    init(chatUseCase: ChatUseCaseProvider) {
        self.chatUseCase = chatUseCase
    }
    
    func transform(input: Input) -> Output {
        let messages: Driver<[Domain.Chat]> = input.loadTrigger
            .flatMapLatest { [weak self] _ -> Driver<[Domain.Chat]> in
                guard let self = self else { return Driver.just([]) }
                return self.chatUseCase.makeFetchChatUseCase().execute(input: "1234")
                    .asDriver(onErrorJustReturn: [])
            }

        return Output(messages: messages)
    }
}

extension HomeTabbarViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        var messages: Driver<[Domain.Chat]>
    }
}
