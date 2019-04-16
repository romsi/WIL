/*:
 # Swift 5
 
 Swift 5 is a major milestone in the evolution of the language. Thanks to ABI stability, the Swift runtime is now included in current and future versions of Apple’s platform operating systems: macOS, iOS, tvOS and watchOS. Swift 5 also introduces new capabilities that are building blocks for future versions, including a reimplementation of String, enforcement of exclusive access to memory during runtime, new data types, and support for dynamically callable types.
 */
import Foundation
import XCTest

class Swift5Tests: XCTestCase {
    
}

TestBuilder.run(tests: Swift5Tests()) { description, lineNumber in
    assertionFailure(description, line: UInt(lineNumber))
}
