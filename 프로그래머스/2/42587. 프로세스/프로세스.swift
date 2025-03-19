import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var sortedPriorities = priorities.sorted(by: <)
    var scheduler = Queue(elements: priorities)
    var result = 0
    
    while true {
        if scheduler.first!.0 < sortedPriorities.last! {
            scheduler.enqueue(scheduler.dequeue()!)
        } else {
            sortedPriorities.popLast()
            let (poppedElement, poppedLocation) = scheduler.dequeue()!
            result += 1
            if poppedLocation == location { return result }
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
        _inStack = (0..<count).map { (elements[$0], $0) }
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