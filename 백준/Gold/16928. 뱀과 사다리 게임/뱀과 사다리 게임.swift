let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var board = Array(0...100)
var visited = Array(repeating: false, count: 101)

for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let x = xy[0], y = xy[1]
    board[x] = y
}
for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uv[0], v = uv[1]
    board[u] = v
}

print(bfs(1))

func bfs(_ start: Int) -> Int {
    var queue = Queue<(i: Int, depth: Int)>()
    queue.enqueue((start, 0))
    visited[start] = true

    while !queue.isEmpty {
        let (current, depth) = queue.dequeue()!

        if current == 100 { return depth }

        for dice in 1...6 {
            let next = current + dice
            if next <= 100, !visited[next] {
                visited[next] = true
                queue.enqueue((board[next], depth + 1))
            }
        }
    }
    return 0
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
