import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = Queue(elements: priorities)
    var sortedPriorities = priorities.sorted(by: >)
    var pointer = 0
    var result = 0
    while !queue.isEmpty {
        let (idx, priority) = queue.dequeue()!
        if sortedPriorities[pointer] == priority {
            pointer += 1
            result += 1
            if idx == location { return result }
        } else {
            queue.enqueue((idx, priority))
        }
    }
    return result
}

struct Queue {
    private var _inStack = [(Int, Int)]()
    private var _outStack = [(Int, Int)]()
    
    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    var first: (Int, Int)? { _outStack.isEmpty ? _inStack.first : _outStack.last }
    
    init(elements: [Int]) {
        let count = elements.count
        _inStack = (0..<count).map { ($0, elements[$0]) }
    }
    
    mutating func enqueue(_ element: (Int, Int)) {
        _inStack.append(element)
    }
    
    @discardableResult mutating func dequeue() -> (Int, Int)? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack = []
        }
        return _outStack.popLast()
    }
}