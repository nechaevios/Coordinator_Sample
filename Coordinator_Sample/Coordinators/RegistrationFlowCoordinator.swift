//
//  SecondFlowCoordinator.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 22.02.2022.
//

import UIKit

protocol RegistrationFlowCoordinatorProtocol: Coordinator {
    func showSecondFlowViewController()
}

class RegistrationFlowCoordinator: RegistrationFlowCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?

    var navigationController: UINavigationController

    var childCoordinators: [Coordinator] = []

    var type: CoordinatorType { coordinatorEventType }
    private var coordinatorEventType: CoordinatorType = .registration

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showSecondFlowViewController()
    }

    deinit {
        print("Registration Coordinator deinit")
    }

    func showSecondFlowViewController() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.navigationItem.title = "Registration"
        navigationController.navigationBar.prefersLargeTitles = true

        registrationViewController.didSendEventClosure = { [weak self] eventType in
            switch eventType {
            case .cancel:
                self?.coordinatorEventType = .tab
                self?.finish()
            }

        }

        navigationController.pushViewController(registrationViewController, animated: true)
    }
}
