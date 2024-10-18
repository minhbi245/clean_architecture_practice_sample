// 
//  LoginViewController.swift
//  AwsomeChatRx
//
//  Created by khanhnvm on 12/7/24.
//

import UIKit
import RxSwift
import RxCocoa
import Stevia

class LoginViewController: UIViewController {
    let viewModel: LoginViewModel
    var disposeBag = DisposeBag()
    let navigator: LoginNavigator
    lazy var emailTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = R.color.mainColor()
        return button
    }()
    
    lazy var registerButton: UIButton = {
       let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = R.color.mainColor()
        return button
    }()

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        setupViews()
        bindViewModel()
    }

    private func bindViewModel() {
        let input = LoginViewModel.Input(email: emailTextField.rx.text.orEmpty.asDriver(), password: passwordTextField.rx.text.orEmpty.asDriver(), loginTrigger: loginButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.loginResult
            .drive(onNext: { result in
                switch result {
                case .success(let user):
                    debugPrint(user)
                    
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            })
            .disposed(by: disposeBag)
    }
}

extension LoginViewController {
    private func createViews() {
        view.backgroundColor = .white
        
        view.subviews {
            emailTextField
            passwordTextField
            loginButton
            registerButton
        }
        
        view.layout {
            100
            |-50-emailTextField-50-| ~ 40
            20
            |-50-passwordTextField-50-| ~ 40
            20
            |-50-loginButton-50-| ~ 50
            20
            |-50-registerButton-50-| ~ 50
        }
    }

    private func setupViews() {
    }
}
