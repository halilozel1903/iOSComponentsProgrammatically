//
//  HapticFeedback.swift
//  ButtonProgrammatically
//

import UIKit

enum HapticFeedback {
    @MainActor
    static func lightImpact() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }

    @MainActor
    static func selectionChanged() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
}
