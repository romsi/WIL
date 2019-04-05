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
}

TestBuilder.run(tests: Swift5Tests()) { description, lineNumber in
    assertionFailure(description, line: UInt(lineNumber))
}
