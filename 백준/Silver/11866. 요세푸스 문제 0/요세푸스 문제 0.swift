let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

var queue = Queue<Int>()

for i in 1...n { queue.enqueue(i) }

var output: [Int] = []


while !queue.isEmpty {
    for _ in 0..<k-1 {
        if let dequeued = queue.dequeue() { queue.enqueue(dequeued) }
    }
    if let dequeued = queue.dequeue() { output.append(dequeued) }
}

print("<", terminator: "")
print(output.map { String($0) }.joined(separator: ", "), terminator: ">\n")

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
