let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var visited = [Array(repeating: true , count: m + 2)] +
              Array(repeating: [true] + Array(repeating: false, count: m) + [true], count: n) +
              [Array(repeating: true , count: m + 2)]
var board = [Array(repeating: "X", count: m + 2)]

let directions = [(0, -1), (0, 1), (-1, 0), (1, 0)]

var start = (0, 0)

for i in 1...n {
    let row = readLine()!.map { String($0) }
    for j in 0..<m {
        if row[j] == "I" { start = (j + 1, i) }
        if row[j] == "X" { visited[i][j + 1] = true }
    }
    board.append(["X"] + row + ["X"])
}

var count = 0
dfs()
print(count == 0 ? "TT" : count)

func dfs() {
    var stack = Stack<(Int, Int)>()
    stack.push(start)

    while !stack.isEmpty {
        let (curX, curY) = stack.pop()!
        if visited[curY][curX] { continue }
        visited[curY][curX] = true
        if board[curY][curX] == "P" { count += 1 }

        for (dX, dY) in directions {
            let nX = curX + dX, nY = curY + dY
            if !visited[nY][nX] { stack.push((nX, nY)) }
        }
    }
}

struct Stack<T> {
    private var _stack = [T]()
    var isEmpty: Bool { _stack.isEmpty }
    mutating func push(_ element: T) { _stack.append(element) }
    mutating func pop() -> T? { _stack.popLast() }
}
