//
//  InsetLabel.swift
//  LabelProgrammatically
//

import UIKit

/// A `UILabel` that reserves padding around its text, honouring the layout
/// direction of the current locale.
final class InsetLabel: UILabel {
    var contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16) {
        didSet { invalidateIntrinsicContentSize() }
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + contentInsets.leading + contentInsets.trailing,
            height: size.height + contentInsets.top + contentInsets.bottom
        )
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insets = resolvedInsets
        var rect = super.textRect(forBounds: bounds.inset(by: insets), limitedToNumberOfLines: numberOfLines)
        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += insets.left + insets.right
        rect.size.height += insets.top + insets.bottom
        return rect
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: resolvedInsets))
    }

    private var resolvedInsets: UIEdgeInsets {
        let isRightToLeft = effectiveUserInterfaceLayoutDirection == .rightToLeft
        return UIEdgeInsets(
            top: contentInsets.top,
            left: isRightToLeft ? contentInsets.trailing : contentInsets.leading,
            bottom: contentInsets.bottom,
            right: isRightToLeft ? contentInsets.leading : contentInsets.trailing
        )
    }
}
