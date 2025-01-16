let n = Int(readLine()!)!

var tree = [Int: [Int]]()
var parent = Array(repeating: 0, count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<(n - 1) {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0], b = ab[1]

    tree[a, default: []].append(b)
    tree[b, default: []].append(a)
}

bfs()

var output = ""
for i in 2...n { output += "\(parent[i])\n" }
print(output, terminator: "")

func bfs() {
    var queue = Queue<Int>()
    queue.enqueue(1)
    visited[1] = true

    while !queue.isEmpty {
        let current = queue.dequeue()!
        for node in tree[current, default: []] {
            if parent[node] == 0 && !visited[node] {
                parent[node] = current
                visited[node] = true
                queue.enqueue(node)
            }
        }
    }
}

struct Queue<T> {
    private var _inStack = [T]()
    private var _outStack = [T]()
    var isEmpty: Bool { _inStack.isEmpty && _outStack.isEmpty }
    mutating func enqueue(_ element: T) { _inStack.append(element) }
    mutating func dequeue() -> T? {
        if _outStack.isEmpty {
            _outStack = _inStack.reversed()
            _inStack.removeAll()
        }
        return _outStack.popLast()
    }
}
