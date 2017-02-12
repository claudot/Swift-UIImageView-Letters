//
//  UIImageViewLettersDemoTests.swift
//  UIImageViewLettersDemoTests
//
//  Created by Paul-Anatole CLAUDOT on 12/02/2017.
//  Copyright © 2017 PAC. All rights reserved.
//

import XCTest
@testable import UIImageViewLettersDemo

class UIImageViewLettersDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShortString() {
        let full:String = "Paul CLAUDOT"
        XCTAssert(full.shortString() == "PC", "Short should return PC")

        let half:String = "Paul"
        XCTAssert(half.shortString() == "P", "Short should return P")

        let empty:String = ""
        XCTAssert(empty.shortString() == "", "Short should return empty string")

        let complex:String = "Paul Anatole CLAUDOT"
        XCTAssert(complex.shortString() == "PC", "Short should return PC")
        
        let min:String = "paul claudot"
        XCTAssert(min.shortString() == "PC", "Short should return PC")
    }
}
