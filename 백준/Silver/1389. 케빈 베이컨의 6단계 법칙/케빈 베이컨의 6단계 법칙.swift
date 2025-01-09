let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var graph = [Int: [Int]]()
var minimum = Int.max
var result = 0

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0], b = ab[1]
    graph[a, default: []].append(b)
    graph[b, default: []].append(a)
}

for i in 1...n {
    let bfsResult = bfs(i)

    if minimum > bfsResult {
        minimum = bfsResult
        result = i
    }
}
print(result)

func bfs(_ start: Int) -> Int {
    var total = 0
    var visited = Array(repeating: false, count: n + 1)

    var queue = Queue<(node: Int, depth: Int)>()
    queue.enqueue((start, 0))
    visited[start] = true

    while !queue.isEmpty {
        let current = queue.dequeue()!

        for node in graph[current.node, default: []] {
            if !visited[node] {
                visited[node] = true
                total += current.depth + 1
                queue.enqueue((node, current.depth + 1))
            }
        }
    }

    return total
}

struct Queue<T> {
    private var _inStack = [T]()
    private var _outStack = [T]()
    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    var count: Int { _inStack.count + _outStack.count }
    mutating func enqueue(_ element: T) { _inStack.append(element) }
    mutating func dequeue() -> T? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack.removeAll()
        }
        return _outStack.popLast()
    }
}
