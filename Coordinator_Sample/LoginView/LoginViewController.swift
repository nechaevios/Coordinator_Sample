//
//  LoginViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 21.02.2022.
//

import UIKit

class LoginViewController: UIViewController {

    var didSendEventClosure: ((LoginViewController.Event) -> Void)?

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()

    private let secondFlowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(loginButton)
        view.addSubview(secondFlowButton)

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        secondFlowButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            secondFlowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondFlowButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            secondFlowButton.widthAnchor.constraint(equalToConstant: 200),
            secondFlowButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        loginButton.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
        secondFlowButton.addTarget(self, action: #selector(didTapSecondFlowButton(_:)), for: .touchUpInside)
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
    enum Event {
        case login
        case registration
    }
}
