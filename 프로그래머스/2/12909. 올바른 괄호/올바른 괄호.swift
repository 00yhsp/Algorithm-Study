import Foundation

func solution(_ s:String) -> Bool {
    var s = s.map(String.init)
    var stack = [String]()
    for i in 0..<s.count {
        if s[i] == "(" { stack.append(s[i]) }
        else { 
            if let popped = stack.popLast() {
                continue
            } else {
                return false
            }
        }
    }
    return stack.isEmpty
}