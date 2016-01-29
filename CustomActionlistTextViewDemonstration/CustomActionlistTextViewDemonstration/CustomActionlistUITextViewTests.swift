//
//  CustomActionlistUITextViewTests
//  Reslink
//
//  Created by Peter Ivanics on 22/01/16.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import CustomActionlistTextViewDemonstration

class CustomActionlistUITextViewTests: XCTestCase
{
    /**
     Test case for enabling and disabling different actions on the CustomActionlistUITextView object.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func testEditingActionsOneByOne()
    {
        let testObject = CustomActionlistUITextView();
        
        // copy
        XCTAssertTrue(testObject.canPerformAction("copy:", withSender: nil));
        testObject.setCopy(false);
        XCTAssertFalse(testObject.canPerformAction("copy:", withSender: nil));
        testObject.setCopy(true);
        XCTAssertTrue(testObject.canPerformAction("copy:", withSender: nil));
        
        // select
        XCTAssertTrue(testObject.canPerformAction("select:", withSender: nil));
        testObject.setSelect(false);
        XCTAssertFalse(testObject.canPerformAction("select:", withSender: nil));
        testObject.setSelect(true);
        XCTAssertTrue(testObject.canPerformAction("select:", withSender: nil));
        
        // define 
        XCTAssertTrue(testObject.canPerformAction("_define:", withSender: nil));
        testObject.setDefine(false);
        XCTAssertFalse(testObject.canPerformAction("_define:", withSender: nil));
        testObject.setDefine(true);
        XCTAssertTrue(testObject.canPerformAction("_define:", withSender: nil));
    }
    
    /**
     Test case for enabling and all actions on the CustomActionlistUITextView object.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func testEditingAllActions()
    {
        let testObject = CustomActionlistUITextView();
        
        testObject.setAllActions(false);
        XCTAssertFalse(testObject.canPerformAction("copy:", withSender: nil));
        XCTAssertFalse(testObject.canPerformAction("selectAll:", withSender: nil));
        XCTAssertFalse(testObject.canPerformAction("select:", withSender: nil));
        XCTAssertFalse(testObject.canPerformAction("_define:", withSender: nil));
        
        testObject.setSelectAll(true);
        XCTAssertTrue(testObject.canPerformAction("selectAll:", withSender: nil));
        XCTAssertFalse(testObject.canPerformAction("copy:", withSender: nil));
        XCTAssertFalse(testObject.canPerformAction("select:", withSender: nil));
        XCTAssertFalse(testObject.canPerformAction("_define:", withSender: nil));
        testObject.setDefine(true);
        XCTAssertTrue(testObject.canPerformAction("_define:", withSender: nil));
        XCTAssertFalse(testObject.canPerformAction("copy:", withSender: nil));
        XCTAssertFalse(testObject.canPerformAction("select:", withSender: nil));
    }
}