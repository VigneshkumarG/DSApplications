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

class BracketsValidator
{
    func validate(input: String) -> Bool  {
        
        // 1. Create Stack of Character
        let stack = Stack<Character>()
        
        // 2. Iterate each character
        for char in input {
            
            // 3. Push character to stack if it is open bracket
            if char == "{" {
                stack.push(element: char)
            }else if char == "}" {
                // 4. Pop until reach any open bracket
                var top = stack.pop()
                while top != nil && top != "{" {
                    top = stack.pop()
                }
                // 5. if there is no open bracket in stack, it is invalid
                if top == nil {
                    return false
                }
            }
        }
        // 6. if there is no open brackets in stack, it is valid
        return stack.count == 0
    }
}

let validator = BracketsValidator()
validator.validate(input: "{{}}")
validator.validate(input: "{}{{}")

