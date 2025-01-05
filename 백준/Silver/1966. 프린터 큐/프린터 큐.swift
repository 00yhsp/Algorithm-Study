let n = Int(readLine()!)!

for _ in 1...n {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let m = arr[1]

    let priorities = readLine()!.split(separator: " ").map { Int($0)! }
    let sortedPriorities = priorities.sorted(by: >)

    var index = 0

    var queue = Queue<(Int, Int)>()

    for (idx, priority) in priorities.enumerated() { queue.enqueue((idx, priority)) }

    while true {
        let item = queue.dequeue()!

        if item.1 == sortedPriorities[index] {
            if item.0 == m { break }
            index += 1
        } else {
            queue.enqueue(item)
        }
    }
    print(index + 1)
}

struct Queue<T> {
    private var _inStack = [T]()
    private var _outStack = [T]()

    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    var count: Int { _inStack.count + _outStack.count }

    mutating func enqueue(_ element: T) {
        _inStack.append(element)
    }

    mutating func dequeue() -> T? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack.removeAll()
        }
        return _outStack.popLast()
    }
}
