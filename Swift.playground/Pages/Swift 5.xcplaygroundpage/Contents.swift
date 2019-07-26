/*:
 # Swift 5
 
 Swift 5 is a major milestone in the evolution of the language. Thanks to ABI stability, the Swift runtime is now included in current and future versions of Apple’s platform operating systems: macOS, iOS, tvOS and watchOS. Swift 5 also introduces new capabilities that are building blocks for future versions, including a reimplementation of String, enforcement of exclusive access to memory during runtime, new data types, and support for dynamically callable types.
 */
import Foundation
import XCTest

class Swift5Tests: XCTestCase {
/*:
 ## Raw Text
 
 [SE-0200](https://github.com/apple/swift-evolution/blob/master/proposals/0200-raw-string-escaping.md) added the ability to create raw strings, where backslashes and quote marks are interpreted as those literal symbols rather than escapes characters or string terminators. This makes a number of use cases more easy, but regular expressions in particular will benefit.
 
 The `#` symbols at the start and end of the string become part of the string delimiter, so Swift understands that the standalone quote marks around “Romain” should be treated as literal quote marks rather than ending the string.
 */
    func testStringDelimiter() {
        XCTAssertEqual(
            #"My name is "Romain"."#,
            "My name is \"Romain\"."
        )
    }
/*:
 Raw strings treats now the backslash as being a literal character in the string, rather than an escape character.
 */
    func testRawStringWithBackslashes() {
        XCTAssertEqual(
            #"My name is \Romain."#,
            "My name is \\Romain."
        )
    }
/*:
 Interpolation works a bit differently.
 */
    func testInterpolationWithNewStringDelimiter() {
        let romain = "Romain"
        XCTAssertEqual(
            #"My name is \#(romain)."#,
            "My name is Romain."
        )
    }
/*:
 In very extrem rare case, the string could be misinterpreted by using a new delimiter and double quote in the string itself.
 */
    func testStringMisinterpretation() {
        XCTAssertEqual(
            ##""The best iOS developers work for Night Shift"#BeSolid"##,
            "\"The best iOS developers work for Night Shift\"#BeSolid"
        )
    }
/*:
 ## Conform Never to Equatable and Hashable
 [SE-0215](https://github.com/apple/swift-evolution/blob/master/proposals/0215-conform-never-to-hashable-and-equatable.md) extended Never so it conforms to `Equatable` and `Hashable`.
 
 Never is very useful for representing impossible code. Most people are familiar with it as the return type of functions like fatalError, but Never is also useful when working with generic classes.
 
 For example, a Result type might use Never for its Value to represent something that always errors or use Never for its Error to represent something that never errors.
 */
    func testNetworkCallThatNeverFails() {
        let data = #"{"email":"romain.asnar@gmail.com"}"#.data(using: .utf8)!
        
        func fetch(_ request: URLRequest,
                   completion: (Result<Data, Never>) -> Void) {
            completion(.success(data))
        }
        
        let expectation = XCTestExpectation(description: "Fetch information about romsi.io.")
        fetch(URLRequest(url: URL(string: "https://romsi.io")!)) { result in
            XCTAssert(result == .success(data))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}

TestBuilder.run(tests: Swift5Tests()) { description, lineNumber in
    assertionFailure(description, line: UInt(lineNumber))
}
