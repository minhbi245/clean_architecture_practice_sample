//
//  RegisterViewController.swift
//  AwsomeChatRx
//
//  Created by khanhnvm on 12/7/24.
//

import UIKit
import RxSwift
import RxCocoa
import Stevia

class RegisterViewController: UIViewController {
    let viewModel: RegisterViewModel
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Email"
        return textfield
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Password"
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    lazy var displayNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Display user name"
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("REGISTER", for: .normal)
        return button
    }()
    
    init(viewModel: RegisterViewModel) {
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
        let input = RegisterViewModel.Input(
            email: emailTextField.rx.text.orEmpty.asDriver(),
            password: passwordTextField.rx.text.orEmpty.asDriver(),
            displayName: displayNameTextField.rx.text.orEmpty.asDriver(),
            registerTrigger: registerButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input: .init())
    }
}

extension RegisterViewController {
    private func createViews() {
    }

    private func setupViews() {
        view.backgroundColor = .white
        
        view.subviews {
            emailTextField
            passwordTextField
            displayNameTextField
            registerButton
        }
        
        view.layout {
            100
            |-50-emailTextField-50-| ~ 40
            20
            |-50-passwordTextField-50-| ~ 40
            20
            |-50-displayNameTextField-50-| ~ 40
            20
            |-50-registerButton-50-| ~ 50
        }
    }
}
