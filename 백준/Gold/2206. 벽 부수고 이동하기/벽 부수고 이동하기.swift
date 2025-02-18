let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var board = [[Int]]()

for _ in 0..<n {
    board.append(readLine()!.compactMap { Int(String($0)) })
}

print(bfs((0, 0)))

func bfs(_ coord: (Int, Int)) -> Int {
    var visited = Array(repeating: Array(repeating: [false, false], count: m), count: n)
    var queue = Queue()
    queue.enqueue((0, 0, 0, 1))

    while !queue.isEmpty {
        let (cR, cC, depth, broken) = queue.dequeue()!
        if cR == n - 1 && cC == m - 1 { return depth + 1 }

        for (dR, dC) in directions {
            let nR = cR + dR
            let nC = cC + dC
            if nR < 0 || nR >= n || nC < 0 || nC >= m { continue }

            if board[nR][nC] == 1 && broken == 1 && !visited[nR][nC][0] {
                visited[nR][nC][0] = true
                queue.enqueue((nR, nC, depth + 1, 0))
            }
            if board[nR][nC] == 0 && !visited[nR][nC][broken] {
                visited[nR][nC][broken] = true
                queue.enqueue((nR, nC, depth + 1, broken))
            }

        }
    }
    return -1
}

struct Queue {
    var inStack = [(Int, Int, Int, Int)]()
    var outStack = [(Int, Int, Int, Int)]()

    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }

    mutating func enqueue(_ element: (Int, Int, Int, Int)) {
        inStack.append(element)
    }

    mutating func dequeue() -> (Int, Int, Int, Int)? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}
