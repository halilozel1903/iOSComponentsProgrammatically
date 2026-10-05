//
//  ComponentCatalogTests.swift
//  ComponentsCatalogTests
//

import XCTest
@testable import ComponentsCatalog

final class ComponentCatalogTests: XCTestCase {
    @MainActor
    func testFilteredMatchingEmptyQueryReturnsAllItems() {
        XCTAssertEqual(ComponentCatalog.filtered(matching: "").count, ComponentCatalog.all.count)
        XCTAssertEqual(ComponentCatalog.filtered(matching: "   ").count, ComponentCatalog.all.count)
    }

    @MainActor
    func testFilteredMatchingFindsTitleSubstring() {
        let results = ComponentCatalog.filtered(matching: "slider")
        XCTAssertEqual(results.map(\.id), ["slider"])
    }

    @MainActor
    func testFilteredMatchingIsCaseInsensitive() {
        let results = ComponentCatalog.filtered(matching: "PROGRESS")
        XCTAssertEqual(results.map(\.id), ["progress"])
    }
}
