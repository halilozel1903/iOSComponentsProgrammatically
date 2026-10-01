//
//  SliderDemoViewController.swift
//  ComponentsCatalog
//

import UIKit

final class SliderDemoViewController: UIViewController {
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.text = "50%"
        label.accessibilityLabel = "Slider value"
        return label
    }()

    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.minimumTrackTintColor = .systemIndigo
        slider.maximumTrackTintColor = .tertiaryLabel
        slider.accessibilityLabel = "Opacity"
        slider.addAction(
            UIAction { [weak self] action in
                guard let slider = action.sender as? UISlider else { return }
                self?.updateValue(slider.value)
            },
            for: .valueChanged
        )
        return slider
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [valueLabel, slider])
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

    private func updateValue(_ rawValue: Float) {
        let rounded = Int(rawValue.rounded())
        valueLabel.text = "\(rounded)%"
        valueLabel.accessibilityValue = "\(rounded) percent"
    }
}
