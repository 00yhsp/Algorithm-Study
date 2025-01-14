import Foundation

let mnh = readLine()!.split(separator: " ").map { Int($0)! }
let n = mnh[0], m = mnh[1], h = mnh[2]
let directions = [(0, 0, -1), (0, 0, 1), (0, -1, 0), (0, 1, 0), (-1, 0, 0), (1, 0, 0)]
var board = [[[Int]]]()
var queue = Queue<(x: Int, y: Int, z: Int, depth: Int)>()

for _ in 0..<h {
    var subBoard = [[Int]]()
    for _ in 0..<m { subBoard.append(readLine()!.split(separator: " ").map { Int($0)! }) }
    board.append(subBoard)
}

for z in 0..<h {
    for y in 0..<m {
        for x in 0..<n {
            if board[z][y][x] == 1 { queue.enqueue((x: x, y: y, z: z, depth: 0)) }
        }
    }
}

let result = bfs()

for z in 0..<h {
    for y in 0..<m {
        if board[z][y].contains(0) {
            print(-1)
            exit(0)
        }
    }
}

print(result)

func bfs() -> Int {
    var days = 0

    while !queue.isEmpty {
        let (x, y, z, depth) = queue.dequeue()!
        days = max(days, depth)

        for (dx, dy, dz) in directions {
            let nx = x + dx, ny = y + dy, nz = z + dz
            if nx >= 0 && nx < n && ny >= 0 && ny < m && nz >= 0 && nz < h && board[nz][ny][nx] == 0 {
                queue.enqueue((x: nx, y: ny, z: nz, depth: depth + 1))
                board[nz][ny][nx] = 1
            }
        }
    }
    return days
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
