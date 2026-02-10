import Foundation

func solution(_ expression:String) -> Int64 {
    var expression = expression
    
    ["+", "-", "*"]
        .forEach { expression = expression.replacingOccurrences(of: $0, with: " \($0) ") }
    
    let expressions = expression.components(separatedBy: " ")
    var operands = expressions.compactMap { Int(String($0)) }
    var operators = expressions.filter { $0 == "+" || $0 == "-" || $0 == "*" }
    var values = [Int]()
    
    let priorities = [
        ["+", "-", "*"], ["+", "*", "-"],
        ["-", "+", "*"], ["-", "*", "+"],
        ["*", "-", "+"], ["*", "+", "-"]
    ]
    
    for priority in priorities {
        var operands = operands
        var operators = operators
        for op in priority {
            while let idx = operators.firstIndex(where: { $0 == op }) {
                let val: Int
                switch op {
                case "+":
                    val = operands[idx] + operands[idx + 1]
                case "-":
                    val = operands[idx] - operands[idx + 1]
                case "*":
                    val = operands[idx] * operands[idx + 1]
                default:
                    val = 0
                }
                operands[idx] = val
                operators.remove(at: idx)
                operands.remove(at: idx + 1)
            }
        }
        values.append(abs(operands[0]))
    }
    
    return Int64(values.max() ?? 0)
}