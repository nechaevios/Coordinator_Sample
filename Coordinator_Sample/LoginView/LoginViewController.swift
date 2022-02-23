//
//  LoginViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 21.02.2022.
//

import UIKit

class LoginViewController: UIViewController, UISetupProtocol {

    var didSendEventClosure: ((LoginViewController.Event) -> Void)?

    private lazy var loginButton = createUIButton(withTitle: "Login", andColor: .systemBlue)
    private lazy var registerButton = createUIButton(withTitle: "Register", andColor: .systemBlue)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addButtonTargets()
        setupConstraints()
    }

    deinit {
        print("LoginViewController deinit")
    }

    @objc private func didTapLoginButton(_ sender: Any) {
        didSendEventClosure?(.login)
    }

    @objc private func didTapSecondFlowButton(_ sender: Any) {
        didSendEventClosure?(.registration)
    }
}

extension LoginViewController {
    // MARK: - - Setup Events

    enum Event {
        case login
        case registration
    }

    // MARK: - - Setup UI

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(loginButton)
        view.addSubview(registerButton)
    }

    private func addButtonTargets() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(didTapSecondFlowButton(_:)), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
