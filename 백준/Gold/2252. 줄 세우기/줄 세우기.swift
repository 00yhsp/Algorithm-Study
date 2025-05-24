let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])

var graph = [Int: [Int]]()
var indegree = [Int](repeating: 0, count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").compactMap { Int($0) }
    let u = uv[0], v = uv[1]
    graph[u, default: []].append(v)
    indegree[v] += 1
}

var queue = Queue()
for node in 1...n {
    if indegree[node] == 0 { queue.enqueue(node) }
}

var result = [Int]()

while !queue.isEmpty {
    let current = queue.dequeue()!
    result.append(current)
    for next in graph[current, default: []] {
        indegree[next] -= 1
        if indegree[next] == 0 { queue.enqueue(next) }
    }
}

struct Queue {
    private var _inStack = [Int]()
    private var _outStack = [Int]()
    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    var count: Int { _inStack.count + _outStack.count }
    mutating func enqueue(_ element: Int) { _inStack.append(element) }
    mutating func dequeue() -> Int? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack.removeAll()
        }
        return _outStack.popLast()
    }
}

print(result.map { String($0) }.joined(separator: " "))