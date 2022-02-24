//
//  SteadyViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 22.02.2022.
//

import UIKit

class SteadyViewController: UIViewController, UISetupProtocol {

    var didSendEventClosure: ((SteadyViewController.Event) -> Void)?

    private lazy var nextButton = createUIButton(withTitle: "Steady", andColor: .systemOrange)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addButtonsTargets()
        setupConstraints()
    }

    deinit {
        print("SteadyViewController deinit")
    }

    @objc private func didTapNextButton(_ sender: Any) {
        didSendEventClosure?(.steady)
    }
}

extension SteadyViewController {
    // MARK: - - Setup Events

    enum Event {
        case steady
    }

    // MARK: - - Setup UI

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(nextButton)
    }

    private func addButtonsTargets() {
        nextButton.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
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
