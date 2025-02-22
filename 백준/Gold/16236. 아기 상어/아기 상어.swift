let n = Int(readLine()!)!
let directions = [(0, 1), (-1, 0), (1, 0), (0, -1)]
var board = [[Int]]()
var sharkCoord = (0, 0)
var sharkSize = 2
var eatCount = 0
var result = 0

for i in 0..<n {
    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
    board.append(row)
    for j in 0..<n {
        if row[j] == 9 { sharkCoord = (i, j) }
    }
}

while let next = bfs(sharkCoord) { eat(next) }
print(result)

func bfs(_ start: (Int, Int)) -> (Int, Int, Int)? {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    visited[start.0][start.1] = true
    var queue = Queue()
    queue.enqueue((start.0, start.1, 0))
    var candidates: [(Int, Int, Int)] = []
    var minDistance = Int.max

    while !queue.isEmpty {
        let (cR, cC, depth) = queue.dequeue()!
        if depth > minDistance { continue }
        for (dR, dC) in directions {
            let nR = cR + dR
            let nC = cC + dC

            if nR < 0 || nR >= n || nC < 0 || nC >= n || visited[nR][nC] || board[nR][nC] > sharkSize { continue }

            visited[nR][nC] = true
            queue.enqueue((nR, nC, depth + 1))
            if board[nR][nC] != 0 && board[nR][nC] < sharkSize {
                if depth + 1 < minDistance {
                    minDistance = depth + 1
                    candidates.append((nR, nC, depth + 1))
                } else if depth + 1 == minDistance {
                    candidates.append((nR, nC, depth + 1))
                }
            }
        }
    }
    if candidates.isEmpty { return nil }
    return candidates.min {
        if $0.0 == $1.0 { return $0.1 < $1.1 }
        return $0.0 < $1.0
    }!
}

func eat(_ fish: (Int, Int, Int)) {
    board[sharkCoord.0][sharkCoord.1] = 0
    board[fish.0][fish.1] = 9
    eatCount += 1
    if eatCount == sharkSize {
        sharkSize += 1
        eatCount = 0
    }
    sharkCoord = (fish.0, fish.1)
    result += fish.2
}

struct Queue {
    var inStack = [(Int, Int, Int)]()
    var outStack = [(Int, Int, Int)]()
    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }

    mutating func enqueue(_ element: (Int, Int, Int)) {
        inStack.append(element)
    }

    mutating func dequeue() -> (Int, Int, Int)? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}
