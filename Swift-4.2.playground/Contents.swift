import Foundation
import XCTest

class SwiftTests: XCTestCase
{
    override func setUp() {
        super.setUp()
    }
    
    func f() -> Int! {
        return 1
    }
    
    func testTypeOfImplicityUnwrappedOptional() {
        let x1 = f()
        XCTAssertTrue(type(of: x1) == Int?.self)
        XCTAssertTrue(type(of: x1) == Int!.self)
        XCTAssertTrue(type(of: x1) != Int.self)
    }
    
    func testNonOptionalTypeUsingImplicityUnwrappedOptional() {
        let x2: Int = f()
        XCTAssertTrue(type(of: x2) == Int.self)
        XCTAssertTrue(type(of: x2) != Int?.self)
        XCTAssertTrue(type(of: x2) != Int!.self)
    }
    
    func testNestedIUO() {
        let x3: [Int!] = [f()]
        XCTAssertTrue(type(of: x3) == [Int!].self)
        XCTAssertTrue(type(of: x3) == [Int?].self)
        XCTAssertTrue(type(of: x3) != [Int].self)
    }
    
    func testCaseIterable() {
        enum Iteration: CaseIterable {
            case singapore
            case paris
            case tokyo
            // case disney(city: City) # - error: type 'City' does not conform to protocol 'CaseIterable'
        }
        XCTAssertEqual(Iteration.allCases, [.singapore, .paris, .tokyo])
    }
}

TestBuilder.run(tests: SwiftTests()) { description, lineNumber in
    assertionFailure(description, line: UInt(lineNumber))
}
