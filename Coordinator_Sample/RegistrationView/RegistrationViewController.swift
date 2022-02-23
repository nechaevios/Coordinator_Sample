//
//  MainViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 21.02.2022.
//

import UIKit

class RegistrationViewController: UIViewController, UISetupProtocol {

    var didSendEventClosure: ((RegistrationViewController.Event) -> Void)?

    private lazy var cancelButton = createUIButton(withTitle: "Cancel", andColor: .systemRed)
    private lazy var textLabel = createUILabel(with: "Enter Your Name", color: .black, alignment: .center)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addButtonsTargets()
        setConstraints()
    }

    deinit {
        print("RegistrationViewController deinit")
    }

    @objc private func didTapCancelButton(_ sender: Any) {
        didSendEventClosure?(.cancel)
    }

}

extension RegistrationViewController {
    // MARK: - - Setup Events

    enum Event {
        case cancel
    }

    // MARK: - - Setup UI

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(textLabel)
        view.addSubview(cancelButton)
    }

    private func addButtonsTargets() {
        cancelButton.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 106),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 200),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
