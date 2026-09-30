//
//  CatalogInsetLabel.swift
//  ComponentsCatalog
//

import UIKit

final class CatalogInsetLabel: UILabel {
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
