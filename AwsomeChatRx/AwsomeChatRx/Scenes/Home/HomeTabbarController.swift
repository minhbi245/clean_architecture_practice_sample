//
//  HomeViewController.swift
//  AwsomeChatRx
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import UIKit

class HomeTabbarController: UIViewController {

    private let viewModel: HomeTabbarViewModel

    init(viewModel: HomeTabbarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.mainYellowColor()
    }
}
