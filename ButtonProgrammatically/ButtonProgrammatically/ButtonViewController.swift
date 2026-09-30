//
//  ButtonViewController.swift
//  ButtonProgrammatically
//
//  Created by Halil Özel on 16.11.2018.
//

import UIKit

/// Builds `UIButton` instances entirely in code using `UIButton.Configuration`,
/// `UIAction` handlers and `UIMenu` based selection.
final class ButtonViewController: UIViewController {
    private var tapCount = 0
    private var isWorking = false
    private var work: Task<Void, Never>?

    private lazy var actionButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = Self.idleTitle
        configuration.subtitle = "Programmatic UIButton"
        configuration.image = UIImage(systemName: "hand.tap.fill")
        configuration.imagePlacement = .leading
        configuration.imagePadding = 8
        configuration.baseBackgroundColor = .systemIndigo
        configuration.cornerStyle = .large
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24)

        let action = UIAction { [weak self] _ in
            HapticFeedback.lightImpact()
            self?.runShortTask()
        }
        let button = UIButton(configuration: configuration, primaryAction: action)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.accessibilityLabel = "Primary action button"
        button.accessibilityHint = "Runs a short async task and updates the title"
        button.configurationUpdateHandler = { [weak self] button in
            guard let self else { return }
            var updated = button.configuration
            updated?.showsActivityIndicator = isWorking
            updated?.title = isWorking ? "Working…" : (tapCount == 0 ? Self.idleTitle : "Tapped \(tapCount) times")
            button.configuration = updated
            button.isEnabled = !isWorking
        }
        return button
    }()

    private lazy var styleButton: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        configuration.title = "Accent color"
        configuration.image = UIImage(systemName: "paintpalette")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 8
        configuration.cornerStyle = .capsule

        let button = UIButton(configuration: configuration)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        button.accessibilityLabel = "Accent color menu"
        button.menu = makeAccentMenu()
        return button
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [actionButton, styleButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 24
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
        NSLayoutConstraint.activate([
            contentStackView.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor),
            contentStackView.leadingAnchor.constraint(greaterThanOrEqualTo: layoutGuide.leadingAnchor, constant: 24),
            contentStackView.trailingAnchor.constraint(lessThanOrEqualTo: layoutGuide.trailingAnchor, constant: -24)
        ])
    }

    /// Shows how a button can drive an async task while reflecting its progress
    /// through the button configuration instead of ad-hoc state juggling.
    private func runShortTask() {
        guard work == nil else { return }

        tapCount += 1
        isWorking = true
        actionButton.setNeedsUpdateConfiguration()

        work = Task { [weak self] in
            try? await Task.sleep(for: .milliseconds(600))
            guard let self else { return }
            isWorking = false
            work = nil
            actionButton.setNeedsUpdateConfiguration()
        }
    }

    private func makeAccentMenu() -> UIMenu {
        let accents: [(name: String, color: UIColor)] = [
            ("Indigo", .systemIndigo),
            ("Teal", .systemTeal),
            ("Pink", .systemPink)
        ]

        let actions = accents.enumerated().map { index, accent in
            UIAction(title: accent.name, state: index == 0 ? .on : .off) { [weak self] _ in
                HapticFeedback.selectionChanged()
                self?.applyAccent(accent.color)
            }
        }

        return UIMenu(options: .singleSelection, children: actions)
    }

    private func applyAccent(_ color: UIColor) {
        actionButton.configuration?.baseBackgroundColor = color
        styleButton.configuration?.baseForegroundColor = color
    }

    private static let idleTitle = "Tap Me"
}
