//
//  ViewController.swift
//  LabelProgrammatically
//
//  Created by Halil Özel on 26.10.2018.
//  Modernized for programmatic UIKit examples.
//

import UIKit

final class ViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label Programmatically"
        label.font = .preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.backgroundColor = .systemYellow.withAlphaComponent(0.35)
        label.shadowColor = .systemRed
        label.shadowOffset = CGSize(width: 2, height: 2)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.highlightedTextColor = .systemBlue
        label.isHighlighted = true
        label.isUserInteractionEnabled = true
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 320),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 120)
        ])
    }
}
