//
//  SegmentedControlDemoViewController.swift
//  ComponentsCatalog
//

import UIKit

final class SegmentedControlDemoViewController: UIViewController {
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "List layout groups rows with headers."
        return label
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["List", "Grid", "Gallery"])
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = .systemIndigo
        control.setTitleTextAttributes(
            [.font: UIFont.preferredFont(forTextStyle: .footnote)],
            for: .normal
        )
        control.addAction(
            UIAction { [weak self] action in
                guard let control = action.sender as? UISegmentedControl else { return }
                self?.updateDetail(for: control.selectedSegmentIndex)
                HapticFeedback.selectionChanged()
            },
            for: .valueChanged
        )
        return control
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [segmentedControl, detailLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        DemoLayout.install(stackView, in: view)
    }

    private func updateDetail(for index: Int) {
        switch index {
        case 0:
            detailLabel.text = "List layout groups rows with headers."
        case 1:
            detailLabel.text = "Grid layout shows uniform tiles in columns."
        default:
            detailLabel.text = "Gallery layout emphasizes hero imagery."
        }
    }
}
