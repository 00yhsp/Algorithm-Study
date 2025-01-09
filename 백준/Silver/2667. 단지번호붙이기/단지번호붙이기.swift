let n = Int(readLine()!)!

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var visited = Array(repeating: Array(repeating: false, count: n + 2), count: n + 2)
var board = [Array(repeating: 0, count: n + 2)]
for _ in 1...n { board.append([0] + readLine()!.map { Int(String($0))! } + [0]) }
board.append(Array(repeating: 0, count: n + 2))

var counts = [Int]()
for r in 1...n {
    for c in 1...n {
        if !visited[r][c] && board[r][c] == 1 { counts.append(dfs(r, c)) }
    }
}

var output = ""
output += "\(counts.count)\n"
counts.sorted().forEach { output += "\($0)\n" }
print(output, terminator: "")

func dfs(_ r: Int, _ c: Int) -> Int {
    var depth = 1
    visited[r][c] = true

    for (dR, dC) in directions {
        let nR = r + dR
        let nC = c + dC
        if !visited[nR][nC] && board[nR][nC] == 1 {
            depth += dfs(nR, nC)
        }
    }
    return depth
}
