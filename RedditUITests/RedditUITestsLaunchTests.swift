//
//  RedditUITestsLaunchTests.swift
//  RedditUITests
//
//  Test Suit with UI test for Reddit-iOS app
//
//  Created by Marina Salnikova on 2023-05-19.
//  Copyright © 2023 Carson Katri. All rights reserved.
//

import XCTest

final class RedditUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testLaunch() throws {
        let app = XCUIApplication()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
