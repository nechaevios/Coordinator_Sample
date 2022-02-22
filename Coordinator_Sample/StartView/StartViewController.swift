//
//  StartViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 22.02.2022.
//

import UIKit

class StartViewController: UIViewController {

    var didSendEventClosure: ((StartViewController.Event) -> Void)?

    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(nextButton)

        nextButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        nextButton.addTarget(self, action: #selector(didTapEndButton(_:)), for: .touchUpInside)
    }

    deinit {
        print("StartViewController deinit")
    }

    @objc private func didTapEndButton(_ sender: Any) {
        didSendEventClosure?(.start)
    }
}

extension StartViewController {
    enum Event {
        case start
    }

}
