//
//  StartViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 22.02.2022.
//

import UIKit

class StartViewController: UIViewController, UISetupProtocol {

    var didSendEventClosure: ((StartViewController.Event) -> Void)?

    private lazy var nextButton = createUIButton(withTitle: "Start", andColor: .systemGreen)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addButtonsTargets()
        setupConstraints()
    }

    deinit {
        print("StartViewController deinit")
    }

    @objc private func didTapEndButton(_ sender: Any) {
        didSendEventClosure?(.start)
    }
}

extension StartViewController {
    // MARK: - - Setup Events

    enum Event {
        case start
    }

    // MARK: - - Setup UI

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(nextButton)
    }

    private func addButtonsTargets() {
        nextButton.addTarget(self, action: #selector(didTapEndButton(_:)), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
