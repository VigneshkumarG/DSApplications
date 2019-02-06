import UIKit


public class Stack<Element>: CustomStringConvertible
{
    private var elements = [Element]()
    
    public func push(element: Element)  {
        elements.insert(element, at: 0)
    }
    
    public func pop() -> Element? {
        if self.count > 0 {
            return elements.removeFirst()
        }
        return nil
    }
    
    public func top() -> Element? {
        return elements.first
    }
    
    public var description: String
    {
        return "\(elements)"
    }
    
    public var count: Int
    {
        return elements.count
    }
}

class BraceValidator
{
    func validate(input: String) -> Bool  {
        
        let stack = Stack<Character>()
        
        for char in input {
            if char == ")" {
                var top = stack.pop()
                while top != nil && top != "(" {
                    top = stack.pop()
                }
                if top == nil {
                    return false
                }
            }else{
                stack.push(element: char)
            }
        }
        
        return stack.count == 0
    }
}

let validator = BraceValidator()
validator.validate(input: "(a(bc))")
validator.validate(input: ")()")

