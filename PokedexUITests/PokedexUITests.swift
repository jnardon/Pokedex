//
//  PokedexUITests.swift
//  PokedexUITests
//
//  Created by Marcelo Gobetti on 6/15/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import XCTest

class PokedexUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITests"]
        app.launch()
    }

    func testExample() {
        let cells = app.descendants(matching: .cell)
        let firstCell = cells.firstMatch
        firstCell.tap()

        XCTAssertTrue(app.otherElements["detailView"].waitForExistence(timeout: 1))
    }

}
