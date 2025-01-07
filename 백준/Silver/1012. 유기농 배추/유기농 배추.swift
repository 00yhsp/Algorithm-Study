let n = Int(readLine()!)!

let directions = [ (-1, 0), (1, 0), (0, -1), (0, 1) ]
var output = ""
for _ in 0..<n {
    solution()
}
print(output, terminator: "")

func solution() {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnk[0], n = mnk[1], k = mnk[2]
    var board = Array(repeating: Array(repeating: 0, count: m + 2), count: n + 2)
    var visited = Array(repeating: Array(repeating: false, count: m + 2), count: n + 2)
    var count = 0

    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        board[input[1] + 1][input[0] + 1] = 1
    }

    for y in 1...n {
        for x in 1...m {
            if !visited[y][x] && board[y][x] == 1 { bfs(y, x) }
        }
    }

    output += "\(count)\n"

    func bfs(_ y: Int, _ x: Int) {
        var queue = Queue<(Int, Int)>()
        queue.enqueue((y, x))
        visited[y][x] = true
        while !queue.isEmpty {
            let (curY, curX) = queue.dequeue()!
            for (nY, nX) in directions {
                if board[curY + nY][curX + nX] == 1 && !visited[curY + nY][curX + nX] {
                    visited[curY + nY][curX + nX] = true
                    queue.enqueue((curY + nY, curX + nX))
                }
            }
        }
        count += 1
    }
}

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
