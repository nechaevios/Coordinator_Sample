//
//  LoginCoordinator.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 21.02.2022.
//

import UIKit

protocol LoginCoordinatorProtocol: Coordinator {
    func showLoginViewController()
}

class LoginCoordinator: LoginCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?

    var navigationController: UINavigationController

    var childCoordinators: [Coordinator] = []

    var type: CoordinatorType { coordinatorEventType }

    private var coordinatorEventType: CoordinatorType = .login

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showLoginViewController()
    }

    deinit {
        print("LoginCoordinator deinit")
    }

    func showLoginViewController() {
        let loginVC = LoginViewController()

        loginVC.didSendEventClosure = { [weak self] eventType in
            switch eventType {
            case .login:
                self?.coordinatorEventType = .login
                self?.finish()
            case .registration:
                self?.coordinatorEventType = .registration
                self?.finish()
            }
        }

        navigationController.pushViewController(loginVC, animated: true)
    }
}
