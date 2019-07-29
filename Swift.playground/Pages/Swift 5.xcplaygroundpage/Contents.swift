/*:
 # Swift 5
 
 Swift 5 is a major milestone in the evolution of the language. Thanks to ABI stability, the Swift runtime is now included in current and future versions of Apple’s platform operating systems: macOS, iOS, tvOS and watchOS. Swift 5 also introduces new capabilities that are building blocks for future versions, including a reimplementation of String, enforcement of exclusive access to memory during runtime, new data types, and support for dynamically callable types.
 */
import Foundation
import XCTest

class Swift5Tests: XCTestCase {}
/*:
 ## Raw Text
 
 [SE-0200](https://github.com/apple/swift-evolution/blob/master/proposals/0200-raw-string-escaping.md) added the ability to create raw strings, where backslashes and quote marks are interpreted as those literal symbols rather than escapes characters or string terminators. This makes a number of use cases more easy, but regular expressions in particular will benefit.
 
 The `#` symbols at the start and end of the string become part of the string delimiter, so Swift understands that the standalone quote marks around “Romain” should be treated as literal quote marks rather than ending the string.
 */
extension Swift5Tests {
    func testStringDelimiter() {
        XCTAssertEqual(
            #"My name is "Romain"."#,
            "My name is \"Romain\"."
        )
    }
}
/*:
 Raw strings treats now the backslash as being a literal character in the string, rather than an escape character.
 */
extension Swift5Tests {
    func testRawStringWithBackslashes() {
        XCTAssertEqual(
            #"My name is \Romain."#,
            "My name is \\Romain."
        )
    }
}
/*:
 Interpolation works a bit differently.
 */
extension Swift5Tests {
    func testInterpolationWithNewStringDelimiter() {
        let romain = "Romain"
        XCTAssertEqual(
            #"My name is \#(romain)."#,
            "My name is Romain."
        )
    }
}
/*:
 In very extrem rare case, the string could be misinterpreted by using a new delimiter and double quote in the string itself.
 */
extension Swift5Tests {
    func testStringMisinterpretation() {
        XCTAssertEqual(
            ##""The best iOS developers work for Night Shift"#BeSolid"##,
            "\"The best iOS developers work for Night Shift\"#BeSolid"
        )
    }
}
/*:
 ## Conform Never to Equatable and Hashable
 [SE-0215](https://github.com/apple/swift-evolution/blob/master/proposals/0215-conform-never-to-hashable-and-equatable.md) extended Never so it conforms to `Equatable` and `Hashable`.
 
 Never is very useful for representing impossible code. Most people are familiar with it as the return type of functions like fatalError, but Never is also useful when working with generic classes.
 
 For example, a Result type might use Never for its Value to represent something that always errors or use Never for its Error to represent something that never errors.
 */
extension Swift5Tests {
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
/*:
 ## Introduce compactMapValues to Dictionary
     
 [SE-0218](https://github.com/apple/swift-evolution/blob/master/proposals/0218-introduce-compact-map-values.md) adds a combined filter/map operation to Dictionary, as a companion to the mapValues and filter methods introduced by [SE-0165](https://github.com/apple/swift-evolution/blob/master/proposals/0165-dict.md). The new compactMapValues operation corresponds to compactMap on Sequence.
 */
extension Swift5Tests {
    func testCompactMapValuesToDictionary() {
        let dictionary: [String: String?] = ["a": "1", "b": nil, "c": "3"]
        let compactedDictionary = dictionary.compactMapValues { $0 }
        
        XCTAssertEqual(compactedDictionary, ["a": "1", "c": "3"])
    }
}
/*:
 ## Adding isMultiple to BinaryInteger
  [SE-0225](https://github.com/apple/swift-evolution/blob/master/proposals/0225-binaryinteger-iseven-isodd-ismultiple.md) adds  `isEven`, `isOdd`, and `isMultiple` to the `BinaryInteger` protocol.
 
 > Only `isMultiple(of:)` was approved during review, so the final implementation does not include `isEven` or `isOdd`. Two default implementations are provided in the standard library; one on `BinaryInteger` and one on `FixedWidthInteger` & `SignedInteger`. For concrete signed and unsigned fixed-size integers, like the standard library types, these two implementations should be nearly optimal.
 */
extension Swift5Tests {
    func testAlternatingRowColor() {
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = UITableViewCell()
        
        cell.contentView.backgroundColor = indexPath.row.isMultiple(of: 2) ? .gray : .white
        
        XCTAssertEqual(cell.contentView.backgroundColor, .white)
    }
}
/*:
 ## Fix ExpressibleByStringInterpolation
 [SE-0228](https://github.com/apple/swift-evolution/blob/master/proposals/0228-fix-expressiblebystringinterpolation.md) proposes a new design that improves `ExpressibleByStringInterpolation` performance, clarity, and efficiency.
 
 Let's build a truncate string interpolation where we want to truncate tokens and emails in order to log it in our external logger.
 */
protocol Truncatable {
    func truncate(element: String) -> String
}
extension DefaultStringInterpolation {
    mutating func appendInterpolation(_ value: String,
                                      truncater: Truncatable)
    {
        self.appendInterpolation(
            truncater.truncate(element: value)
        )
    }
}
/*:
 Let's create a truncater class that truncate token only and test it using a real generated token.
 */
class TokenTruncater: Truncatable {
    private let lenght: Int
    private let trailing: String
    init(lenght: Int = 3, trailing: String = "...") {
        self.lenght = lenght
        self.trailing = trailing
    }
    func truncate(element: String) -> String {
        return element.count > lenght ? element.prefix(lenght) + trailing : element
    }
}
extension Swift5Tests {
    func testTruncateTokenWhenLogging() {
        let token = "5e2f842-e0c4-42d3-ae74-750407389118"
        XCTAssertEqual("\(token, truncater: TokenTruncater())", "5e2...")
    }
}
/*:
 Let's create a truncater class that truncate email only and test it using my personal email.
 */
class EmailTruncater: Truncatable {
    private let componentLenght: Int
    private let trailing: String
    init(componentLenght: Int = 3, trailing: String = "•••••") {
        self.componentLenght = componentLenght
        self.trailing = trailing
    }
    private func emailMatch(_ element: String) -> NSTextCheckingResult? {
        let pattern = "(?<identifier>[A-Z0-9a-z._%+-]+)@(?<host>[A-Za-z0-9.-]+)\\.(?<extension>[A-Za-z]{2,64})"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        let nsrange = NSRange(element.startIndex..<element.endIndex,
                              in: element)
        return regex.firstMatch(in: element, options: [], range: nsrange)
    }
    private func component(identifier: String, match: NSTextCheckingResult, element: String) -> String? {
        let nsrange = match.range(withName: identifier)
        guard nsrange.location != NSNotFound,
            let range = Range(nsrange, in: element) else {
                return nil
        }
        return String(element[range])
    }
    func truncate(element: String) -> String {
        guard let match = emailMatch(element),
            let identifier = component(identifier: "identifier", match: match, element: element),
            let host = component(identifier: "host", match: match, element: element),
            let ext = component(identifier: "extension", match: match, element: element) else {
                return element
        }
        func truncateIfNeeded(_ element: String) -> String {
            return ((element.count > componentLenght) ? element.prefix(componentLenght) + trailing : element)
        }
        return truncateIfNeeded(identifier)
            + "@" + truncateIfNeeded(host)
            + "." + truncateIfNeeded(ext)
    }
}
extension Swift5Tests {
    func testTruncateEmailWhenLogging() {
        let token = "romain.asnar@gmail.com"
        XCTAssertEqual("\(token, truncater: EmailTruncater())", "rom•••••@gma•••••.com")
    }
}
/*:
 ## Add Result to the Standard Library
 
 [SE-0235](https://github.com/apple/swift-evolution/blob/master/proposals/0235-add-result.md) adds `Result` type commonly used for manual propagation and handling of errors in other languages and within the Swift community.

 Most commonly, and seen in abundance when using Apple or Foundation APIs, Result can serve to unify the awkwardly disparate parameters seen in asynchronous completion handlers. For instance, URLSession's completion handlers take three optional parameters:
 
     URLSession.shared.dataTask(with: url) { (data, response, error) in
         guard error != nil else { return handleError(error!) }
         guard let data = data, let response = response else { return } // Impossible?
         handleResponse(response, data)
     }
 */
extension URLSession {
    func dataTask(with: URL, completion: ((Result<(response: URLResponse, data: Data), Error>) -> Void)) {
        completion(.success((response: URLResponse(), data: Data())))
    }
}
extension Swift5Tests {
    func testResultTypeWhenPerformingAsynchronousAPICalls() {
        let expectation = XCTestExpectation(description: "dataTask should get a valid response")
        let handleResponse: ((URLResponse, Data) -> Void) = { _, _ in
            expectation.fulfill()
        }
        let handleError: ((Error) -> Void) = { _ in }
        URLSession.shared.dataTask(with: URL(string: "https://romsi.io")!) { (result: Result<(response: URLResponse, data: Data), Error>) in
            switch result {
            case let .success(success):
                handleResponse(success.response, success.data)
            case let .failure(error):
                handleError(error)
            }
        }
        wait(for: [expectation], timeout: 1)
    }
}
/*:
 ## Execute Playground Tests
 
 To execute XCTest tests in playground file, you need to add a test observer and manually do assertion in case of failure.
 */
TestBuilder.run(tests: Swift5Tests()) { description, lineNumber in
    assertionFailure(description, line: UInt(lineNumber))
}
