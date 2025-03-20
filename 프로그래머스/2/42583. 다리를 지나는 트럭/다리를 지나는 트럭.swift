import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var truck_weights_reversed = Array(truck_weights.reversed())
    var seconds = 0
    var weightOnBridge = 0
    var queue = Queue()
    
    while !(truck_weights_reversed.isEmpty && queue.isEmpty) {
        queue.cross()
        if queue.first?.1 == 0 {
            let (poppedWeight, _) = queue.dequeue()!
            weightOnBridge -= poppedWeight
        }
        if let last = truck_weights_reversed.last, last + weightOnBridge <= weight, queue.count + 1 <= bridge_length {
            truck_weights_reversed.popLast()
            queue.enqueue((last, bridge_length))
            weightOnBridge += last
        }
        seconds += 1
    }
    return seconds
}

struct Queue {
    private var _inStack = [(Int, Int)]()
    private var _outStack = [(Int, Int)]()
    
    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    var count: Int { _inStack.count + _outStack.count }
    var first: (Int, Int)? { _outStack.isEmpty ? _inStack.first : _outStack.last }
    
    mutating func enqueue(_ element: (Int, Int)) {
        _inStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> (Int, Int)? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack = []
        }
        return _outStack.popLast()
    }
    
    mutating func cross() {
        _inStack = _inStack.map { ($0.0, $0.1 - 1) }
        _outStack = _outStack.map { ($0.0, $0.1 - 1) }
    }
}