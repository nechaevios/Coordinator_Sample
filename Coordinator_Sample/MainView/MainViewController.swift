//
//  MainViewController.swift
//  Coordinator_Sample
//
//  Created by Nechaev Sergey  on 21.02.2022.
//

import UIKit

class MainViewController: UIViewController {

    let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        label.text = "Hoooray!"
        label.textColor = .blue
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testLabel)
        view.backgroundColor = .white
        setConstraints()
    }

    private func setConstraints() {
        testLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        testLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        testLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }

}
