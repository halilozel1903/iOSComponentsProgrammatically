//
//  DemoLayout.swift
//  ComponentsCatalog
//

import UIKit

enum DemoLayout {
    static func install(_ stackView: UIStackView, in view: UIView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: guide.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: guide.trailingAnchor, constant: -24),
            stackView.widthAnchor.constraint(lessThanOrEqualToConstant: 480)
        ])
    }
}
