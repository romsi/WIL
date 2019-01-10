import Foundation
import XCTest

class SwiftTests: XCTestCase
{
    override func setUp() {
        super.setUp()
    }
    
    func testTypeOfImplicityUnwrappedOptional() {
        func f() -> Int! {
            return 1
        }
        let x1 = f()
        XCTAssertTrue(type(of: x1) == Int?.self)
        XCTAssertTrue(type(of: x1) == Int!.self)
    }
}

TestBuilder.run(tests: SwiftTests()) { description, lineNumber in
    assertionFailure(description, line: UInt(lineNumber))
}
