//
//  RedditUITests.swift
//  RedditUITests
//
//  Test Suit with UI test for Reddit-iOS app
//
//  Created by Marina Salnikova on 2023-05-19.
//  Copyright © 2023 Carson Katri. All rights reserved.
//

import XCTest

final class RedditUITests: XCTestCase {
    let defaultSearchValue = "r/swift"
    let defaultSostingValue = "hot"

    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    fileprivate func tapButtonByText(_ text: String) {
        XCUIApplication().buttons[text].tap()
    }
    
    fileprivate func searchByText(_ app: XCUIApplication, _ testSearchValue: String) {
        let searchInput: XCUIElement = app.textFields.firstMatch
        searchInput.doubleTap()
        app.typeText(XCUIKeyboardKey.delete.rawValue)
        searchInput.typeText(testSearchValue)
        app.typeText("\r")
    }
    
    func testPostSearch()throws {
        let app = XCUIApplication()
        
        let testSearchValue = "Test"
        
        //click on search menu
        tapButtonByText(defaultSearchValue)
        
        //input new search text
        searchByText(app, testSearchValue)

        //verify search result
        XCTAssert(app.buttons["r/" + testSearchValue].exists)
        XCTAssert(app.staticTexts[testSearchValue].exists)
    }
    
    func testPostSorting() throws {
        let testSoringValue = "Top"
        
        //click on sort button
        tapButtonByText(defaultSostingValue)
        
        //select sorting option
        tapButtonByText(testSoringValue)
        
        //verify result
        XCTAssert(XCUIApplication().buttons[testSoringValue.lowercased()].exists)
    }
    
    func testPostView() throws {
        let app = XCUIApplication()
        
        //select first post from list
        let firstPost = app.cells.firstMatch
        let postHeader = firstPost.staticTexts.firstMatch.label
        firstPost.tap()
        
        //verify that post view opened
        XCTAssert(app.staticTexts[defaultSearchValue].exists)
        XCTAssert(app.staticTexts[postHeader].exists)
        XCTAssertFalse(app.buttons[defaultSearchValue].exists)
        XCTAssertFalse(app.buttons[defaultSostingValue].exists)
    }
}
