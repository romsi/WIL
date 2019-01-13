/*:
 # Swift 4.2
 
 Swift 4.2 is now officially released! Swift 4.2 builds on the strengths of Swift 4, delivering faster compile times, improving the debugging experience, updating the standard library, and converging on binary compatibility.
 */
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
/*:
 ## Implicitly unwrapped optionals

 [SE-0054](https://github.com/apple/swift-evolution/blob/master/proposals/0054-abolish-iuo.md "Abolish ImplicitlyUnwrappedOptional type") was accepted already in March 2016, but it took until Swift 4.2 to implement it completely.
 
 In Swift 4.2, [implicitly unwrapped optionals](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID334) still exist — that is, you can annotate a type declaration with a `!` instead of a `?` to declare an optional value that will be unwrapped automatically. But there isn’t a separate `ImplicitlyUnwrappedOptional` type anymore.
 
 Instead, implicitly unwrapped optionals are just normal optionals (and have the type `Optional<T>`) with a special annotation that tells the compiler to automatically add a force-unwrap when needed.
 
 There is a great article on the official Swift blog that goes into much more detail about the implications of this change: [Reimplementation of Implicitly Unwrapped Optionals](https://swift.org/blog/iuo/).
 */
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
/*:
 ## Enumerating enum cases

 [SE-0194 — Derived Collection of Enum Cases](https://github.com/apple/swift-evolution/blob/master/proposals/0194-derived-collection-of-enum-cases.md "Derived Collection of Enum Cases"): The compiler can automatically generate an `allCases` property for enums, providing you with an always-up-to-date list of enum cases. All you have to do is conform your enum to the new `CaseIterable` protocol.
*/
    func testCaseIterable() {
        enum Iteration: CaseIterable {
            case singapore
            case paris
            case tokyo
            // case disney(city: City) # - error: type 'City' does not conform to protocol 'CaseIterable'
        }
        XCTAssertEqual(Iteration.allCases, [.singapore, .paris, .tokyo])
    }
/*:
 ## Bool.toggle

 [SE-0199](https://github.com/apple/swift-evolution/blob/master/proposals/0199-bool-toggle.md "Adding toggle to Bool") adds a mutating `toggle` method to `Bool`.

 This is especially useful if you need to toggle a boolean value deep inside a nested data structure because you don’t have to repeat the same expression on both sides of the assignment.
*/
    func testBoolToggle() {
        var enabled = true
        enabled.toggle()
        XCTAssertTrue(enabled == false)
    }
/*:
 ## Sequence and Collection algorithms

 ### `last(where:)`, `lastIndex(where:)`, and `lastIndex(of:)`

 [SE-0204](https://github.com/apple/swift-evolution/blob/master/proposals/0204-add-last-methods.md "Add last(where:) and lastIndex(where:) Methods") adds a `last(where:)` method to `Sequence`, and `lastIndex(where:)` and `lastIndex(of:)` methods to `Collection`.
 */
    func testNewCollectionLastMethod() {
        let numberSequence = [20, 30, 10, 40, 20, 30, 10, 40, 20]
        XCTAssertEqual(numberSequence.last { $0 > 20 }, 40)
        XCTAssertEqual(numberSequence.lastIndex(where: { $0 > 15} ), 8)
        XCTAssertEqual(numberSequence.lastIndex(of: 10), 6)
    }
/*:
 ### `removeAll(where:)`

 [SE-0197](https://github.com/apple/swift-evolution/blob/master/proposals/0197-remove-where.md "Adding in-place removeAll(where:) to the Standard Library") adds a `removeAll(where:)` method to `RangeReplaceableCollection`, allowing you to remove all elements from a collection that match the given predicate.

 It’s essentially a mutating variant of `filter` with an inverted predicate — `filter` _keeps_ elements that match the predicate, whereas `removeAll(where:)` _removes_ them.
 */
    func testNewRemoveAllFunction() {
        var name = ["John", "William", "Michael", "Gary", "Liam"]
        name.removeAll { $0.hasSuffix("am") }
        XCTAssertEqual(name, ["John", "Michael", "Gary"])
    }
/*:
 ## Conditional conformance enhancements

 ### Synthesized conformances in extensions

 A small but important improvement to compiler synthesized protocol conformances, such as the automatic `Equatable` and `Hashable` conformances introduced in [SE-0185](https://github.com/apple/swift-evolution/blob/master/proposals/0185-synthesize-equatable-hashable.md "Synthesizing Equatable and Hashable conformance").

 Protocol conformances can now be synthesized in extensions and not only on the type definition (the extension must still be in the same file as the type definition). This is more than a cosmetic change because it allows automatic synthesis of conditional conformances to `Equatable`, `Hashable`, `Encodable`, and `Decodable`.

 This example is from the [What’s New in Swift session at WWDC 2018](https://developer.apple.com/videos/play/wwdc2018/401/). We can conditionally conform `Either` to `Equatable` and `Hashable`:
 */
    func testSynthetizingEquatableConformance() {
        struct User: Equatable {
            var name: String
            var email: String
            var hasSuperPower: Bool
        }
        XCTAssertEqual(
            User(name: "Romain", email: "romain.asnar@gmail.com", hasSuperPower: true),
            User(name: "Romain", email: "romain.asnar@gmail.com", hasSuperPower: true)
        )
    }
}

TestBuilder.run(tests: SwiftTests()) { description, lineNumber in
    assertionFailure(description, line: UInt(lineNumber))
}
