import Foundation
import XCTest

class SwiftTests: XCTestCase
{
    override func setUp() {
        super.setUp()
    }
    
    func testExample() {
        var ok = "ok"
        XCTAssertTrue(ok == "ok")
    }
}

TestBuilder.run(tests: SwiftTests()) { description, lineNumber in
    assertionFailure(description, line: UInt(lineNumber))
}
