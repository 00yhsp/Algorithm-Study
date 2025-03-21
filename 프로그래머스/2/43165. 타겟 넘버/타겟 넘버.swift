import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let count = numbers.count
    var result = 0
    
    func bfs() {
        var queue = Queue()
        queue.enqueue((0, -1))
        
        while !queue.isEmpty {
            let (currentNode, currentDepth) = queue.dequeue()!
            if currentDepth == count - 1 {
                if currentNode == target { result += 1 }
                continue
            }
            for op in operations.allCases {
                switch op {
                case .plus:
                    queue.enqueue((currentNode + numbers[currentDepth + 1], currentDepth + 1))
                case .minus:
                    queue.enqueue((currentNode - numbers[currentDepth + 1], currentDepth + 1))
                }
            }
        }
    }
    bfs()
    return result
}

struct Queue {
    var _inStack = [(Int, Int)]()
    var _outStack = [(Int, Int)]()
    
    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    
    mutating func enqueue(_ element: (Int, Int)) {
        _inStack.append(element)
    }
    
    mutating func dequeue() -> (Int, Int)? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack = []
        }
        return _outStack.popLast()
    }
}

enum operations: CaseIterable {
    case plus, minus
}