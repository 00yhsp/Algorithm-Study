let rct = readLine()!.split(separator: " ").compactMap { Int($0) }
let r = rct[0], c = rct[1], t = rct[2]

let directions = [(0, -1), (0, 1), (1, 0), (-1, 0)]
var board = [[Int]]()
var cleaners = [Int]()
var result = 2
board.reserveCapacity(r)

for i in 0..<r {
    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
    board.append(row)
    if row[0] == -1 { cleaners.append(i) }
}

for _ in 0..<t {
    diffusion()
    clean()
}

board.forEach { result += $0.reduce(0, +) }
print(result)

func diffusion() {
    var diffBoard = Array(repeating: Array(repeating: 0, count: c), count: r)

    for cR in 0..<r {
        for cC in 0..<c {
            if board[cR][cC] == 0 { continue }
            var diffusionCount = 0
            for (dR, dC) in directions {
                let nR = cR + dR, nC = cC + dC
                if nR >= 0, nR < r, nC >= 0, nC < c, board[nR][nC] != -1 {
                    diffusionCount += 1
                    diffBoard[nR][nC] += Int(Double(board[cR][cC] / 5))
                }
            }
            diffBoard[cR][cC] -= Int(Double(board[cR][cC]) / 5) * diffusionCount
        }
    }
    for i in 0..<r {
        for j in 0..<c { board[i][j] += diffBoard[i][j] }
    }
}

func clean() {
    top()
    bottom()
}

func top() {
    let cleaner = cleaners[0]

    for i in stride(from: cleaner - 2, through: 0, by: -1) { board[i + 1][0] = board[i][0] }
    for j in 0..<c - 1 { board[0][j] = board[0][j + 1] }
    for i in 0..<cleaner { board[i][c - 1] = board[i + 1][c - 1] }
    for j in stride(from: c - 1, to: 1, by: -1) { board[cleaner][j] = board[cleaner][j - 1] }

    board[cleaner][1] = 0
}

func bottom() {
    let bottom = cleaners[1]

    for i in (bottom + 2)..<r { board[i - 1][0] = board[i][0] }
    for j in 0..<c - 1 { board[r - 1][j] = board[r - 1][j + 1] }
    for i in stride(from: r - 1, to: bottom, by: -1) { board[i][c - 1] = board[i - 1][c - 1] }
    for j in stride(from: c - 1, to: 1, by: -1) { board[bottom][j] = board[bottom][j - 1] }

    board[bottom][1] = 0
}
