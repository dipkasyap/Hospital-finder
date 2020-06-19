//
//  Hospital_FinderUITests.swift
//  Hospital FinderUITests
//
//  Created by Admin on 19/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import XCTest

class Hospital_FinderUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppFlow() throws {
        
        let app = XCUIApplication()
        app.launch()
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Find Hospital app screen shots"
        attachment.lifetime = .keepAlways
        add(attachment)
        
        let tablesQuery = app.tables
        
        let illnessCell = tablesQuery.element(boundBy: 0)
        XCTAssertTrue(illnessCell.exists)
        illnessCell.tap()
        
        app.buttons["0"].tap()
        
        app.navigationBars["Hospitals"].buttons["Pain Level"].tap()
        app.navigationBars["Pain Level"].buttons["Illness"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sheep Sneeze"]/*[[".cells.staticTexts[\"Sheep Sneeze\"]",".staticTexts[\"Sheep Sneeze\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["4"].tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
