//
//  SwitchDemoViewController.swift
//  ComponentsCatalog
//

import UIKit

final class SwitchDemoViewController: UIViewController {
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Notifications are off"
        label.accessibilityLabel = "Notification status"
        return label
    }()

    private lazy var toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.accessibilityLabel = "Notifications"
        toggle.addAction(
            UIAction { [weak self] action in
                guard let toggle = action.sender as? UISwitch else { return }
                self?.updateStatus(isOn: toggle.isOn)
                HapticFeedback.selectionChanged()
            },
            for: .valueChanged
        )
        return toggle
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [statusLabel, toggleSwitch])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 24
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        DemoLayout.install(stackView, in: view)
    }

    private func updateStatus(isOn: Bool) {
        statusLabel.text = isOn ? "Notifications are on" : "Notifications are off"
        statusLabel.textColor = isOn ? .systemGreen : .secondaryLabel
        if isOn {
            HapticFeedback.success()
        }
    }
}
