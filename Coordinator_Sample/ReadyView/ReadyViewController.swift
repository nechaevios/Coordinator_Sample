//
//  ReadyViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 22.02.2022.
//

import UIKit

class ReadyViewController: UIViewController, UISetupProtocol {

    var didSendEventClosure: ((ReadyViewController.Event) -> Void)?

    private lazy var nextButton = createUIButton(
        withTitle: "Tab Coordinator - next, Ready",
        andColor: .systemRed
    )
    private lazy var localSceneButton = createUIButton(
        withTitle: "Ready Coordinator - Settings",
        andColor: .systemOrange
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addButtonTargets()
        setConstraints()
    }

    deinit {
        print("ReadyViewController deinit")
    }

    @objc private func didTapNextButton(_ sender: Any) {
        didSendEventClosure?(.ready)
    }

    @objc private func didTapLocalSceneButton(_ sender: Any) {
//        didSendEventClosure?(.localFromReady)
    }
}

extension ReadyViewController {
    // MARK: - - Setup Events

    enum Event {
        case ready
    }

    // MARK: - - Setup UI

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(nextButton)
        view.addSubview(localSceneButton)
    }

    private func addButtonTargets() {
        nextButton.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
        localSceneButton.addTarget(self, action: #selector(didTapLocalSceneButton(_:)), for: .touchUpInside)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 300),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            localSceneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            localSceneButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            localSceneButton.widthAnchor.constraint(equalToConstant: 300),
            localSceneButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
