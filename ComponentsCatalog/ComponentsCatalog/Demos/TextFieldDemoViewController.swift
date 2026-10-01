//
//  TextFieldDemoViewController.swift
//  ComponentsCatalog
//

import UIKit

final class TextFieldDemoViewController: UIViewController {
    private var emailLooksValid = false

    private let feedbackLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Enter at least three characters."
        label.accessibilityLabel = "Validation message"
        return label
    }()

    private lazy var emailField: UITextField = {
        let field = UITextField()
        field.borderStyle = .none
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 12
        field.layer.cornerCurve = .continuous
        field.font = .preferredFont(forTextStyle: .body)
        field.adjustsFontForContentSizeCategory = true
        field.placeholder = "name@example.com"
        field.keyboardType = .emailAddress
        field.textContentType = .emailAddress
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.delegate = self
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        field.leftViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        field.rightViewMode = .always
        field.accessibilityLabel = "Email address"
        field.addAction(
            UIAction { [weak self] _ in
                self?.validateEmail(field.text ?? "")
            },
            for: .editingChanged
        )
        return field
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailField, feedbackLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 12
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        emailField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        DemoLayout.install(stackView, in: view)
    }

    private func validateEmail(_ text: String) {
        let isValid = text.count >= 3 && text.contains("@")
        feedbackLabel.text = isValid ? "Looks good." : "Enter at least three characters."
        feedbackLabel.textColor = isValid ? .systemGreen : .secondaryLabel
        if isValid, !emailLooksValid {
            HapticFeedback.success()
        }
        emailLooksValid = isValid
    }
}

extension TextFieldDemoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
