/*:
 # Stack
 
 A stack is like an array but with limited functionality. You can only push to add a new element to the top of the stack, pop to remove the element from the top, and peek at the top element without popping it off.
 
 Why would you want to do this? Well, in many algorithms you want to add objects to a temporary list at some point and then pull them off this list again at a later time. Often the order in which you add and remove these objects matters.
 
 A stack gives you a LIFO or last-in first-out order. The element you pushed last is the first one to come off with the next pop.
 
 Inserting at the beginning of an array is expensive, an O(n) operation, because it requires all existing array elements to be shifted in memory. Adding at the end is O(1); it always takes the same amount of time, regardless of the size of the array.
 */
struct Stack<Element> {
    fileprivate var elements: [Element] = []
    
    var count: Int { return elements.count }
    
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    func pop() -> Element? {
        guard let lastElement = elements.last else { return nil }
        elements.dropLast()
        return lastElement
    }
}
extension Stack: CustomStringConvertible {
    var description: String {
        return "\(elements)>"
    }
}
var stack = Stack<String>()
stack.push("Hello")
stack.push(" ")
stack.push("World")
stack.push("!")
stack.pop()
/*:
 ## Conversion of Infix expression to Postfix expression
 
 Infix notation is the notation commonly used in arithmetical and logical formulae and statements. It is characterized by the placement of operators between operands —"infixed operators"— such as the plus sign in 2 + 2.
 
 Postfix notation is a mathematical notation in which operators follow their operands, in contrast to infix notation.
 
 Let’s consider the following infix expression.
 
    A + B
 
 We would like to transform it to the following postfix expression using stacks.
 
    A B +
 */
enum Operator: Character, CaseIterable {
    typealias RawValue = Character
    case plus = "+"
    init?(rawValue: Character) {
        switch rawValue {
        case "+":
            self = .plus
        default:
            return nil
        }
    }
}

enum PostfixConverterError: Error {
    case parsingFailed
    case operatorFailed
}

func convertToPostfixNotation(expression: String) throws -> String {
    var postfixExpression = ""
    var operators = Stack<Operator>()
    expression.forEach { c in
        if let `operator` = Operator(rawValue: c) {
            operators.push(`operator`)
        }
        else {
            postfixExpression += String(c)
        }
    }
    if postfixExpression.isEmpty && operators.count == 0 {
        throw PostfixConverterError.parsingFailed
    }
    guard let `operator` = operators.pop()?.rawValue else {
        throw PostfixConverterError.operatorFailed
    }
    return postfixExpression + " \(`operator`)"
}

try convertToPostfixNotation(expression: "A + B")
