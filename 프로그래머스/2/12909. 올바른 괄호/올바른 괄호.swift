import Foundation

func solution(_ s:String) -> Bool {
    var stack = [Character]()
    
    for chr in s {
        if chr == Character("(") {
            stack.append(chr)
        } else {
            if stack.isEmpty { return false }
            stack.popLast()
        }
    }
    if !stack.isEmpty { return false }
    return true
}