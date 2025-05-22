import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var rank = 0
    var queue = Queue(elements: priorities)
    var max = priorities.sorted(by: >)
    
    while !queue.isEmpty {
        let first = queue.dequeue()!
        if first.1 < max[rank] { queue.enqueue(first) }
        else { 
            rank += 1
            if first.0 == location { return rank }
        }
    }
    
    return 0
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