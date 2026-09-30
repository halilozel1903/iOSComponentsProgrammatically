//
//  HapticFeedback.swift
//  ComponentsCatalog
//

import UIKit

/// Centralizes haptic feedback so demo screens stay consistent and easy to tune.
enum HapticFeedback {
    @MainActor
    static func selectionChanged() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }

    @MainActor
    static func lightImpact() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }

    @MainActor
    static func success() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.success)
    }
}
