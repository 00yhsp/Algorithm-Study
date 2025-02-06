let n = Int(readLine()!)!

var board = Array(repeating: 0, count: n)
var visited = Array(repeating: false, count: n)

var result = 0

nQueen(0)

print(result)

func nQueen(_ row: Int) {
    if row == n {
        result += 1
        return
    }

    for col in 0..<n {
        if visited[col] { continue }
        board[row] = col
        if promising(row) {
            visited[col] = true
            nQueen(row + 1)
            visited[col] = false
        }
    }
}

func promising(_ row: Int) -> Bool {
    for i in 0..<row {
        if board[i] == board[row] || abs(board[row] - board[i]) == row - i {
            return false
        }
    }
    return true
}
