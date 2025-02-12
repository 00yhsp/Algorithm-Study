let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])

var board = [[Int]]()
var viruses = [(Int, Int)]()
var spaces = [(Int, Int)]()

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var result = 0

for i in 0..<n {
    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
    board.append(row)
    for j in 0..<m {
        if row[j] == 2 { viruses.append((i, j)) }
        if row[j] == 0 { spaces.append((i, j)) }
    }
}

var comb = combinations(spaces, 3)
for walls in comb { result = max(find(walls), result) }

print(result)

func find(_ walls: [(Int, Int)]) -> Int {
    func dfs(_ viruses: [(Int, Int)]) {
        var stack = viruses

        while !stack.isEmpty {
            let (cR, cC) = stack.removeLast()

            for (dr, dc) in directions {
                let nR = cR + dr
                let nC = cC + dc

                if nR >= 0, nR < n, nC >= 0, nC < m, board[nR][nC] == 0 {
                    board[nR][nC] = 2
                    stack.append((nR, nC))
                }
            }
        }
    }

    var board = board
    for (r, c) in walls { board[r][c] = 1 }
    dfs(viruses)

    return board.reduce(0) { $0 + $1.filter { $0 == 0 }.count }
}

func combinations(_ array: [(Int, Int)], _ count: Int) -> [[(Int, Int)]] {
    if count == 0 { return [[]] }
    if array.isEmpty { return [] }

    var result = [[(Int, Int)]]()
    let rest = Array(array.dropFirst())

    for comb in combinations(rest, count - 1) {
        result.append([array.first!] + comb)
    }
    result += combinations(rest, count)
    return result
}
