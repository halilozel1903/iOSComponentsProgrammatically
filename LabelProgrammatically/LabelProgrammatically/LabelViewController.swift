//
//  LabelViewController.swift
//  LabelProgrammatically
//
//  Created by Halil Özel on 26.10.2018.
//

import UIKit

/// Builds and styles `UILabel` instances entirely in code, with Auto Layout,
/// Dynamic Type and dark mode support.
final class LabelViewController: UIViewController {
    private let headlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Label Programmatically"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.accessibilityTraits = .header
        return label
    }()

    private let badgeLabel: InsetLabel = {
        let label = InsetLabel()
        label.text = "UIKit"
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.textAlignment = .center
        label.layer.cornerRadius = 12
        label.layer.cornerCurve = .continuous
        label.layer.masksToBounds = true
        label.accessibilityLabel = "UIKit badge"
        return label
    }()

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.attributedText = NSAttributedString(LabelViewController.makeBodyText())
        label.accessibilityLabel = "Description of programmatic label setup"
        return label
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headlineLabel, badgeLabel, bodyLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLayout()
    }

    private func configureLayout() {
        view.addSubview(contentStackView)

        let layoutGuide = view.safeAreaLayoutGuide
        let readableWidth = contentStackView.widthAnchor.constraint(equalToConstant: 480)
        readableWidth.priority = .defaultHigh

        NSLayoutConstraint.activate([
            contentStackView.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor),
            contentStackView.leadingAnchor.constraint(greaterThanOrEqualTo: layoutGuide.leadingAnchor, constant: 24),
            contentStackView.trailingAnchor.constraint(lessThanOrEqualTo: layoutGuide.trailingAnchor, constant: -24),
            readableWidth,
            // The stack is centre aligned, so the wrapping labels need an explicit width.
            headlineLabel.widthAnchor.constraint(equalTo: contentStackView.widthAnchor),
            bodyLabel.widthAnchor.constraint(equalTo: contentStackView.widthAnchor)
        ])
    }

    /// `AttributedString` keeps rich text styling type safe instead of relying on
    /// stringly typed `NSAttributedString.Key` dictionaries.
    private static func makeBodyText() -> AttributedString {
        var text = AttributedString("Every label on this screen is created, styled and laid out programmatically.")
        text.font = UIFont.preferredFont(forTextStyle: .body)
        text.foregroundColor = UIColor.secondaryLabel

        if let range = text.range(of: "programmatically") {
            text[range].font = UIFont.preferredFont(forTextStyle: .headline)
            text[range].foregroundColor = UIColor.systemIndigo
            text[range].underlineStyle = .single
        }

        return text
    }
}
