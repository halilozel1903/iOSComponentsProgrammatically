//
//  CatalogInsetLabelTests.swift
//  ComponentsCatalogTests
//

import XCTest
@testable import ComponentsCatalog

final class CatalogInsetLabelTests: XCTestCase {
    @MainActor
    func testIntrinsicContentSizeIncludesInsets() {
        let label = CatalogInsetLabel()
        label.text = "Hi"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)

        let baseSize = label.sizeThatFits(CGSize(width: 300, height: CGFloat.greatestFiniteMagnitude))
        let intrinsic = label.intrinsicContentSize

        XCTAssertGreaterThan(intrinsic.width, baseSize.width - 20)
        XCTAssertGreaterThan(intrinsic.height, 0)
    }
}
