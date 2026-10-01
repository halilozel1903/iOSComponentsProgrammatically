//
//  ComponentItem.swift
//  ComponentsCatalog
//

import UIKit

struct ComponentItem: Identifiable, Equatable {
    let id: String
    let title: String
    let subtitle: String
    let symbolName: String
    let accessibilityHint: String
    private let viewControllerBuilder: @MainActor () -> UIViewController

    init(
        id: String,
        title: String,
        subtitle: String,
        symbolName: String,
        accessibilityHint: String,
        viewControllerBuilder: @escaping @MainActor () -> UIViewController
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.symbolName = symbolName
        self.accessibilityHint = accessibilityHint
        self.viewControllerBuilder = viewControllerBuilder
    }

    @MainActor
    func makeViewController() -> UIViewController {
        viewControllerBuilder()
    }

    static func == (lhs: ComponentItem, rhs: ComponentItem) -> Bool {
        lhs.id == rhs.id
    }
}

enum ComponentCatalog {
    static let all: [ComponentItem] = [
        ComponentItem(
            id: "label",
            title: "UILabel",
            subtitle: "Dynamic Type, attributed text and insets",
            symbolName: "textformat",
            accessibilityHint: "Opens the label styling demo"
        ) { LabelPreviewViewController() },
        ComponentItem(
            id: "button",
            title: "UIButton",
            subtitle: "Configuration, menus and async actions",
            symbolName: "hand.tap.fill",
            accessibilityHint: "Opens the button configuration demo"
        ) { ButtonPreviewViewController() },
        ComponentItem(
            id: "switch",
            title: "UISwitch",
            subtitle: "UIAction-driven toggles with live feedback",
            symbolName: "switch.2",
            accessibilityHint: "Opens the switch demo"
        ) { SwitchDemoViewController() },
        ComponentItem(
            id: "slider",
            title: "UISlider",
            subtitle: "Continuous values with Dynamic Type labels",
            symbolName: "slider.horizontal.3",
            accessibilityHint: "Opens the slider demo"
        ) { SliderDemoViewController() },
        ComponentItem(
            id: "segmented",
            title: "UISegmentedControl",
            subtitle: "Single selection with SF Symbol segments",
            symbolName: "square.split.1x2",
            accessibilityHint: "Opens the segmented control demo"
        ) { SegmentedControlDemoViewController() },
        ComponentItem(
            id: "progress",
            title: "UIProgressView",
            subtitle: "Determinate progress driven from code",
            symbolName: "chart.bar.fill",
            accessibilityHint: "Opens the progress view demo"
        ) { ProgressDemoViewController() },
        ComponentItem(
            id: "textfield",
            title: "UITextField",
            subtitle: "Borderless fields, placeholders and validation",
            symbolName: "character.cursor.ibeam",
            accessibilityHint: "Opens the text field demo"
        ) { TextFieldDemoViewController() }
    ]

    static func filtered(matching query: String) -> [ComponentItem] {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return all }

        return all.filter { item in
            item.title.localizedCaseInsensitiveContains(trimmed)
                || item.subtitle.localizedCaseInsensitiveContains(trimmed)
        }
    }
}
