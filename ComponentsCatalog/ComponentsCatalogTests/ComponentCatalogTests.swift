//
//  ComponentCatalogTests.swift
//  ComponentsCatalogTests
//

import XCTest
@testable import ComponentsCatalog

final class ComponentCatalogTests: XCTestCase {
    func testFilteredMatchingEmptyQueryReturnsAllItems() {
        XCTAssertEqual(ComponentCatalog.filtered(matching: "").count, ComponentCatalog.all.count)
        XCTAssertEqual(ComponentCatalog.filtered(matching: "   ").count, ComponentCatalog.all.count)
    }

    func testFilteredMatchingFindsTitleSubstring() {
        let results = ComponentCatalog.filtered(matching: "slider")
        XCTAssertEqual(results.map(\.id), ["slider"])
    }

    func testFilteredMatchingIsCaseInsensitive() {
        let results = ComponentCatalog.filtered(matching: "PROGRESS")
        XCTAssertEqual(results.map(\.id), ["progress"])
    }
}
