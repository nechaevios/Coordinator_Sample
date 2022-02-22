//
//  MainViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 21.02.2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    var didSendEventClosure: ((RegistrationViewController.Event) -> Void)?

    let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter your name"
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()

    private let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }

    deinit {
        print("RegistrationViewController deinit")
    }

    @objc private func didTapCancelButton(_ sender: Any) {
        didSendEventClosure?(.cancel)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(testLabel)
        view.addSubview(cancelButton)

        cancelButton.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)

    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 106),
            testLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            testLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.topAnchor.constraint(equalTo: testLabel.bottomAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 200),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

extension RegistrationViewController {
    enum Event {
        case cancel
    }
}
