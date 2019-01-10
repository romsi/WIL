import Foundation
import XCTest

public typealias AssertionBlockType = ((String, Int) -> Void)

public class TestObserver: NSObject, XCTestObservation
{
    var assertionBlock: AssertionBlockType
    
    public init(assertionBlock: @escaping AssertionBlockType) {
        self.assertionBlock = assertionBlock
        super.init()
    }
    
    public func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionBlock(description, lineNumber)
    }
}

public class TestBuilder
{
    public class func run(tests: XCTestCase, assertionBlock: @escaping AssertionBlockType) {
        let testObserver = TestObserver(assertionBlock: assertionBlock)
        XCTestObservationCenter.shared.addTestObserver(testObserver)
        type(of: tests).defaultTestSuite.run()
    }
}
