//
//  ProgressDemoViewController.swift
//  ComponentsCatalog
//

import UIKit

final class ProgressDemoViewController: UIViewController {
    private var progressTask: Task<Void, Never>?

    private let progressView: UIProgressView = {
        let view = UIProgressView(style: .bar)
        view.progressTintColor = .systemIndigo
        view.trackTintColor = .tertiarySystemFill
        view.progress = 0
        view.accessibilityLabel = "Upload progress"
        return view
    }()

    private lazy var startButton: UIButton = {
        var configuration = UIButton.Configuration.borderedProminent()
        configuration.title = "Simulate upload"
        configuration.cornerStyle = .medium

        let action = UIAction { [weak self] _ in
            self?.startSimulation()
        }
        return UIButton(configuration: configuration, primaryAction: action)
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [progressView, startButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 24
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        DemoLayout.install(stackView, in: view)
    }

    deinit {
        progressTask?.cancel()
    }

    private func startSimulation() {
        guard progressTask == nil else { return }

        progressView.setProgress(0, animated: false)
        startButton.isEnabled = false
        HapticFeedback.lightImpact()

        progressTask = Task { [weak self] in
            guard let self else { return }

            for step in 1...10 {
                try? await Task.sleep(for: .milliseconds(200))
                guard !Task.isCancelled else { return }
                let progress = Float(step) / 10
                progressView.setProgress(progress, animated: true)
                progressView.accessibilityValue = "\(Int(progress * 100)) percent"
            }

            HapticFeedback.success()
            startButton.isEnabled = true
            progressTask = nil
        }
    }
}
