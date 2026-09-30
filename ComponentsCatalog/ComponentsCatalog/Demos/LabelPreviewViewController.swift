//
//  LabelPreviewViewController.swift
//  ComponentsCatalog
//

import UIKit

final class LabelPreviewViewController: UIViewController {
    private let headlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Programmatic labels"
        label.font = .preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.accessibilityTraits = .header
        return label
    }()

    private let badgeLabel: CatalogInsetLabel = {
        let label = CatalogInsetLabel()
        label.text = "Dynamic Type"
        label.font = .preferredFont(forTextStyle: .footnote)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.cornerCurve = .continuous
        label.layer.masksToBounds = true
        label.accessibilityLabel = "Dynamic Type badge"
        return label
    }()

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.attributedText = NSAttributedString(Self.makeBodyText())
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [headlineLabel, badgeLabel, bodyLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        DemoLayout.install(stackView, in: view)
    }

    private static func makeBodyText() -> AttributedString {
        var text = AttributedString("Labels pick up Light and Dark mode automatically when you use semantic colors.")
        text.font = UIFont.preferredFont(forTextStyle: .body)
        text.foregroundColor = UIColor.secondaryLabel

        if let range = text.range(of: "semantic colors") {
            text[range].foregroundColor = UIColor.systemIndigo
            text[range].font = UIFont.preferredFont(forTextStyle: .headline)
        }

        return text
    }
}
