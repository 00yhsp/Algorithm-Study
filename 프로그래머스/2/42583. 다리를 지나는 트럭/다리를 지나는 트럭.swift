import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var seconds = 0
    var trucks = Array(truck_weights.reversed())
    var bridge = Queue()
    var curWeight = 0
    
    while !(trucks.isEmpty && bridge.isEmpty) {
        
        bridge.cross()
        if bridge.first?.1 == 0 { curWeight -= bridge.dequeue()!.0 }
        seconds += 1
        
        if !trucks.isEmpty, trucks.last! + curWeight <= weight, bridge.count < bridge_length {
            let truck = trucks.removeLast()
            bridge.enqueue((truck, bridge_length))
            curWeight += truck
        }
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
        for i in 0..<_inStack.count { _inStack[i].1 -= 1 }
        for i in 0..<_outStack.count { _outStack[i].1 -= 1 }
    }
}