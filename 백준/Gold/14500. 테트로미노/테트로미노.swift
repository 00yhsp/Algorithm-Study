let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var board = [[Int]]()

for _ in 0..<n { board.append(readLine()!.split(separator: " ").map { Int($0)! }) }

let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var maxSum = 0

func dfs(_ x: Int, _ y: Int, _ depth: Int, _ sum: Int) {
    if depth == 4 {
        maxSum = max(maxSum, sum)
        return
    }

    for (dx, dy) in directions {
        let nx = x + dx
        let ny = y + dy

        if nx >= 0, ny >= 0, nx < n, ny < m, !visited[nx][ny] {
            visited[nx][ny] = true
            dfs(nx, ny, depth + 1, sum + board[nx][ny])
            visited[nx][ny] = false
        }
    }
}

func checkEdgeCase(_ x: Int, _ y: Int) {
    let shapes = [
        [(0, 0), (0, 1), (0, -1), (-1, 0)],
        [(0, 0), (0, 1), (0, -1), (1, 0)],
        [(0, 0), (-1, 0), (1, 0), (0, -1)],
        [(0, 0), (-1, 0), (1, 0), (0, 1)]
    ]

    for shape in shapes {
        var sum = 0
        var isValid = true
        for (dx, dy) in shape {
            let nx = x + dx
            let ny = y + dy
            if nx >= 0, ny >= 0, nx < n, ny < m {
                sum += board[nx][ny]
            } else {
                isValid = false
                break
            }
        }
        if isValid { maxSum = max(maxSum, sum) }
    }
}

for i in 0..<n {
    for j in 0..<m {
        visited[i][j] = true
        dfs(i, j, 1, board[i][j])
        visited[i][j] = false
        checkEdgeCase(i, j)
    }
}

print(maxSum)
