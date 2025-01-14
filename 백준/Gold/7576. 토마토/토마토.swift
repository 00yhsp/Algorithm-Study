import Foundation

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let m = mn[0], n = mn[1]

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var board = [[Int]]()
var queue = Queue<(x: Int, y: Int, depth: Int)>()

for _ in 0..<n { board.append(readLine()!.split(separator: " ").map { Int($0)! }) }

for y in 0..<n {
    for x in 0..<m {
        if board[y][x] == 1 { queue.enqueue((x: x, y: y, depth: 0)) }
    }
}

let result = bfs()

for y in 0..<n {
    if board[y].contains(0) {
        print(-1)
        exit(0)
    }
}

print(result)

func bfs() -> Int {
    var days = 0
    while !queue.isEmpty {
        let (x, y, depth) = queue.dequeue()!
        days = max(days, depth)
        for (dx, dy) in directions {
            let nx = x + dx, ny = y + dy
            if nx >= 0, nx < m, ny >= 0, ny < n, board[ny][nx] == 0 {
                queue.enqueue((x: nx, y: ny, depth: depth + 1))
                board[ny][nx] = 1
            }
        }
    }
    return days
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
