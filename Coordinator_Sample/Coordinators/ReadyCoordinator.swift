//
//  ReadyCoordinator.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 22.02.2022.
//

import UIKit

protocol ReadyCoordinatorProtocol: Coordinator {
    var navigationController: UINavigationController { get set  }
    func showReadyViewController()
}

class ReadyCoordinator: ReadyCoordinatorProtocol {

    var finishDelegate: CoordinatorFinishDelegate?

    var navigationController: UINavigationController

    var childCoordinators: [Coordinator] = []

    var type: CoordinatorType { .registration }

    func start() {
        showReadyViewController()
    }

    func showReadyViewController() {
        let localVC = RegistrationViewController()
        navigationController.pushViewController(localVC, animated: false)
    }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

}

extension ReadyCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })

        switch childCoordinator.type {
        case .registration:
            navigationController.viewControllers.removeAll()
            navigationController.pushViewController(LoginViewController(), animated: false)
        default:
            break
        }
    }

}
