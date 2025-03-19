import Foundation

func solution(_ s:String) -> Bool
{
    var stack = [Int]()

    if s.isEmpty { return true }
    if s.count == 1 { return false }
    
    for chr in s {
        if chr == Character("(") {
            stack.append(1)
        } else {
            if stack.isEmpty { return false }
            stack.popLast()
        }
    }

    return stack.isEmpty ? true : false
}