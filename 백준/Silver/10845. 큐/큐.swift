let n = Int(readLine()!)!

var queue = Queue<Int>()

for _ in 1...n {
    let input = readLine()!.split(separator: " ")
    switch input[0] {
    case "push":
        queue.enqueue(Int(input[1])!)
    case "pop":
        if let dequeued = queue.dequeue() { print(dequeued) }
        else { print(-1) }
    case "size":
        print(queue.count)
    case "empty":
        print(queue.isEmpty ? 1 : 0)
    case "front":
        if let first = queue.first { print(first) }
        else { print(-1) }
    case "back":
        if let last = queue.last { print(last) }
        else { print(-1) }
    default:
        break
    }
}

struct Queue<T> {
    private var _inStack = [T]()
    private var _outStack = [T]()

    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    var count: Int { _inStack.count + _outStack.count }
    var first: T? { !_outStack.isEmpty ? _outStack.last : _inStack.first }
    var last: T? { !_inStack.isEmpty ? _inStack.last : _outStack.first }

    mutating func enqueue(_ element: T) { _inStack.append(element) }
    mutating func dequeue() -> T? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack.removeAll()
        }
        return _outStack.popLast()
    }
}
