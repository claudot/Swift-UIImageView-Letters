//  Created by Paul-Anatole CLAUDOT on 12/02/2017.
//  Copyright © 2017 PAC. All rights reserved.
//

import XCTest
@testable import UIImageViewLettersDemo

final class UIImageViewLettersDemoTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShortString() {
        let full: String = "Paul CLAUDOT"
        XCTAssert(full.initials == "PC", "Short should return PC")

        let half: String = "Paul"
        XCTAssert(half.initials == "P", "Short should return P")

        let empty: String = ""
        XCTAssert(empty.initials == "", "Short should return empty string")

        let complex: String = "Paul Anatole CLAUDOT"
        XCTAssert(complex.initials == "PC", "Short should return PC")

        let min: String = "paul claudot"
        XCTAssert(min.initials == "PC", "Short should return PC")
    }

    func testColorHashString() {
        let empty: UIColor = UIColor.colorHash(name: nil)
        XCTAssert(empty == UIColor.red, "Short be red")

        let first: UIColor = UIColor.colorHash(name: "Paul CLAUDOT")
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        first.getRed(&r, green: &g, blue: &b, alpha: &a)

        XCTAssert(r <= 0.84, "Short be <= 0.84")
        XCTAssert(r >= 0.1, "Short be >= 0.1")
        XCTAssert(g <= 0.84, "Short be <= 0.84")
        XCTAssert(g >= 0.1, "Short be >= 0.1")
        XCTAssert(b <= 0.84, "Short be <= 0.84")
        XCTAssert(b >= 0.1, "Short be >= 0.1")

        let second: UIColor = UIColor.colorHash(name: "Other Name")
        second.getRed(&r, green: &g, blue: &b, alpha: &a)

        XCTAssert(r <= 0.84, "Short be <= 0.84")
        XCTAssert(r >= 0.1, "Short be >= 0.1")
        XCTAssert(g <= 0.84, "Short be <= 0.84")
        XCTAssert(g >= 0.1, "Short be >= 0.1")
        XCTAssert(b <= 0.84, "Short be <= 0.84")
        XCTAssert(b >= 0.1, "Short be >= 0.1")

        let third: UIColor = UIColor.colorHash(name: "Other")
        third.getRed(&r, green: &g, blue: &b, alpha: &a)

        XCTAssert(r <= 0.84, "Short be <= 0.84")
        XCTAssert(r >= 0.1, "Short be >= 0.1")
        XCTAssert(g <= 0.84, "Short be <= 0.84")
        XCTAssert(g >= 0.1, "Short be >= 0.1")
        XCTAssert(b <= 0.84, "Short be <= 0.84")
        XCTAssert(b >= 0.1, "Short be >= 0.1")
    }
}
