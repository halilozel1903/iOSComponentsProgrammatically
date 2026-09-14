//
//  ViewController.swift
//  ButtonProgrammatically
//
//  Created by Halil Özel on 16.11.2018.
//  Modernized for programmatic UIKit examples.
//

import UIKit

final class ViewController: UIViewController {
    private let actionButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "TurkishKit"
        configuration.subtitle = "Programmatic Button"
        configuration.baseBackgroundColor = .systemBlue
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .large
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 28, bottom: 18, trailing: 28)

        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        setupActions()
    }

    private func setupLayout() {
        view.addSubview(actionButton)

        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            actionButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            actionButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
    }

    private func setupActions() {
        actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
    }

    @objc private func didTapActionButton() {
        actionButton.configuration?.title = "Tapped!"
    }
}
