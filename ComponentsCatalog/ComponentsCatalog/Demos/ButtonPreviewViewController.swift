//
//  ButtonPreviewViewController.swift
//  ComponentsCatalog
//

import UIKit

final class ButtonPreviewViewController: UIViewController {
    private var tapCount = 0

    private lazy var primaryButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Tap for haptics"
        configuration.image = UIImage(systemName: "sparkles")
        configuration.imagePadding = 8
        configuration.cornerStyle = .large
        configuration.baseBackgroundColor = .systemIndigo

        let action = UIAction { [weak self] _ in
            guard let self else { return }
            tapCount += 1
            HapticFeedback.lightImpact()
            var updated = primaryButton.configuration
            updated?.title = "Tapped \(tapCount) time\(tapCount == 1 ? "" : "s")"
            primaryButton.configuration = updated
        }

        let button = UIButton(configuration: configuration, primaryAction: action)
        button.accessibilityHint = "Increments a counter and plays a light impact haptic"
        return button
    }()

    private lazy var menuButton: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        configuration.title = "Pick accent"
        configuration.image = UIImage(systemName: "paintpalette")
        configuration.cornerStyle = .capsule

        let button = UIButton(configuration: configuration)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        button.menu = makeAccentMenu()
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [primaryButton, menuButton])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        DemoLayout.install(stackView, in: view)
    }

    private func makeAccentMenu() -> UIMenu {
        let colors: [(String, UIColor)] = [
            ("Indigo", .systemIndigo),
            ("Mint", .systemMint),
            ("Orange", .systemOrange)
        ]

        let actions = colors.enumerated().map { index, entry in
            UIAction(title: entry.0, state: index == 0 ? .on : .off) { [weak self] _ in
                self?.applyAccent(entry.1)
                HapticFeedback.selectionChanged()
            }
        }

        return UIMenu(options: .singleSelection, children: actions)
    }

    private func applyAccent(_ color: UIColor) {
        primaryButton.configuration?.baseBackgroundColor = color
        menuButton.configuration?.baseForegroundColor = color
    }
}
