let rc = readLine()!.split(separator: " ").map { Int($0)! }
let r = rc[0], c = rc[1]

var board = [[Int]]()
board.reserveCapacity(r)
for _ in 0..<r { board.append(readLine()!.map { Int(exactly: $0.asciiValue!)! - 65 }) }

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var result = 0
dfs()
print(result)

func dfs() {
    var stack = Stack()
    stack.push((0, 0, 1, 1 << board[0][0]))

    while !stack.isEmpty {
        let (cr, cc, cd, visited) = stack.pop()!
        result = max(result, cd)
        if result == 26 { break }
        for (dr, dc) in directions {
            let nr = cr + dr, nc = cc + dc
            if nr < 0 || nr >= r || nc < 0 || nc >= c  { continue }
            if (1 << board[nr][nc]) & visited == 0 {
                stack.push((nr, nc, cd + 1, visited | (1 << board[nr][nc])) )
            }
        }
    }
}

struct Stack {
    var elements = [(Int, Int, Int, Int)]()

    var isEmpty : Bool { elements.isEmpty }

    mutating func push(_ element: (Int, Int, Int, Int)) {
        elements.append(element)
    }

    mutating func pop() -> (Int, Int, Int, Int)? {
        elements.popLast()
    }
}
