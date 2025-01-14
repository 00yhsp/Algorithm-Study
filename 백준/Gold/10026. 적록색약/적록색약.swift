let n = Int(readLine()!)!

var board = [[String]]()
var blindBoard = [[String]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var blindVisited = Array(repeating: Array(repeating: false, count: n), count: n)
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for _ in 0..<n {
    let row = readLine()!.map { String($0) }
    let blindRow = row.map { $0 == "G" ? "R" : $0 }
    board.append(row)
    blindBoard.append(blindRow)
}

var count = 0
var blindCount = 0
for y in 0..<n {
    for x in 0..<n {
        if !visited[y][x] {
            count += 1
            bfs(x: x, y: y, board: &board, visited: &visited)
        }
        if !blindVisited[y][x] {
            blindCount += 1
            bfs(x: x, y: y, board: &blindBoard, visited: &blindVisited)
        }
    }
}

print(count, blindCount)


func bfs(x: Int, y: Int, board: inout [[String]], visited: inout [[Bool]]) {
    var queue = Queue<(x: Int, y: Int)>()
    queue.enqueue((x, y))
    let start = board[y][x]
    visited[y][x] = true

    while !queue.isEmpty {
        let (x, y) = queue.dequeue()!
        for (dx, dy) in directions {
            let nx = x + dx, ny = y + dy
            if nx >= 0, nx < n, ny >= 0, ny < n, !visited[ny][nx], board[ny][nx] == start {
                queue.enqueue((nx, ny))
                visited[ny][nx] = true
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
