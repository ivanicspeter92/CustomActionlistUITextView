//
//  CustomActionlistTextViewDemonstrationUITests.swift
//  CustomActionlistTextViewDemonstration
//
//  Created by Peter Ivanics on 29/01/16.
//  Copyright © 2016 peterivanics. All rights reserved.
//

import XCTest

class CustomActionlistTextViewDemonstrationUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testTextViewActions()
    {
        let app = XCUIApplication();
        let element = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element;
         /**************/
        let normalTextView = element.childrenMatchingType(.TextView).elementBoundByIndex(0)
        normalTextView.tap();
        normalTextView.tap();
        sleep(1);
        
        XCTAssertTrue(app.menuItems["Copy"].exists);
        XCTAssertTrue(app.menuItems["Cut"].exists);
        XCTAssertTrue(app.menuItems["Select All"].exists);
        XCTAssertTrue(app.menuItems["Select"].exists);
        XCTAssertTrue(app.menuItems["Paste"].exists);
         /**************/
        let copyOnlyTextView = element.childrenMatchingType(.TextView).elementBoundByIndex(1)
        copyOnlyTextView.tap();
        copyOnlyTextView.tap();
        sleep(1);
        
        XCTAssertTrue(app.menuItems["Copy"].exists);
        XCTAssertFalse(app.menuItems["Cut"].exists);
        XCTAssertFalse(app.menuItems["Select All"].exists);
        XCTAssertFalse(app.menuItems["Select"].exists);
        XCTAssertFalse(app.menuItems["Paste"].exists);
         /**************/
        let readOnlyTextView = element.childrenMatchingType(.TextView).elementBoundByIndex(2);
        readOnlyTextView.tap();
        readOnlyTextView.tap();
        sleep(1);
        
        XCTAssertFalse(app.menuItems["Copy"].exists);
        XCTAssertFalse(app.menuItems["Cut"].exists);
        XCTAssertFalse(app.menuItems["Select All"].exists);
        XCTAssertFalse(app.menuItems["Select"].exists);
        XCTAssertFalse(app.menuItems["Paste"].exists);
         /**************/
        let everythingButCutAndDeleteTextView = element.childrenMatchingType(.TextView).elementBoundByIndex(3);
        everythingButCutAndDeleteTextView.tap();
        everythingButCutAndDeleteTextView.tap();
        sleep(1);
        
        XCTAssertTrue(app.menuItems["Copy"].exists);
        XCTAssertFalse(app.menuItems["Cut"].exists);
        XCTAssertTrue(app.menuItems["Select All"].exists);
        XCTAssertTrue(app.menuItems["Select"].exists);
        XCTAssertTrue(app.menuItems["Paste"].exists);
        /**************/
        let pasteAndSelectTextView = element.childrenMatchingType(.TextView).elementBoundByIndex(4);
        pasteAndSelectTextView.tap();
        pasteAndSelectTextView.tap();
        sleep(1);
        
        XCTAssertFalse(app.menuItems["Copy"].exists);
        XCTAssertFalse(app.menuItems["Cut"].exists);
        XCTAssertTrue(app.menuItems["Select All"].exists);
        XCTAssertTrue(app.menuItems["Select"].exists);
        XCTAssertTrue(app.menuItems["Paste"].exists);
    }
}
