//
//  ReadyViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 22.02.2022.
//

import UIKit

class ReadyViewController: UIViewController {

    var didSendEventClosure: ((ReadyViewController.Event) -> Void)?

    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tab Coordinator - next, Ready", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let localSceneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ready Coordinator - Settings", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }

    deinit {
        print("ReadyViewController deinit")
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(nextButton)
        view.addSubview(localSceneButton)
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

    @objc private func didTapNextButton(_ sender: Any) {
        didSendEventClosure?(.ready)
    }

    @objc private func didTapLocalSceneButton(_ sender: Any) {
//        didSendEventClosure?(.localFromReady)
    }
}

extension ReadyViewController {
    enum Event {
        case ready
//        case localFromReady
    }

}
