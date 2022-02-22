//
//  SteadyViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 22.02.2022.
//

import UIKit

class SteadyViewController: UIViewController {

    var didSendEventClosure: ((SteadyViewController.Event) -> Void)?

    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Steady", for: .normal)
        button.backgroundColor = .systemOrange
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

        nextButton.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
    }

    deinit {
        print("SteadyViewController deinit")
    }

    @objc private func didTapNextButton(_ sender: Any) {
        didSendEventClosure?(.steady)
    }
}

extension SteadyViewController {
    enum Event {
        case steady
    }

}
