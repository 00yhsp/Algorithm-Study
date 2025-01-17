let ab = readLine()!.split(separator: " ").map { Int($0)! }
let a = ab[0], b = ab[1]

print(bfs(a, b))

func bfs(_ a: Int, _ b: Int) -> Int {
    var queue = Queue<Int>()
    queue.enqueue((a, 1))

    while !queue.isEmpty {
        let (node, depth) = queue.dequeue()!
        if node == b { return depth }

        for next in [node * 10 + 1, node * 2] {
            if next <= 1_000_000_000 { queue.enqueue((next, depth + 1)) }
        }
    }
    return -1
}

struct Queue<T> {
    typealias Element = (node: T, depth: Int)
    private var _inStack = [Element]()
    private var _outStack = [Element]()
    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    var count: Int { _inStack.count + _outStack.count }
    mutating func enqueue(_ element: Element) { _inStack.append(element) }
    mutating func dequeue() -> Element? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack.removeAll()
        }
        return _outStack.popLast()
    }
}
