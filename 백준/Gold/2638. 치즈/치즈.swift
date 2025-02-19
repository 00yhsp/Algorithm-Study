let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var board = [[Int]]()
var spaces = [(Int, Int)]()
var cheeses = Set<Cheese>()
board.reserveCapacity(n)

for i in 0..<n {
    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
    board.append(row)
    for j in 0..<m {
        if row[j] == 1 { cheeses.insert(Cheese(r: i, c: j)) }
    }
}

infectBFS((0, 0))

print(calcTimes())

func calcTimes() -> Int {
    var result = 0

    while !cheeses.isEmpty {
        for cheese in cheeses {
            var count = 0
            for (dr, dc) in directions {
                let nR = cheese.r + dr
                let nC = cheese.c + dc

                if nR >= 0, nR < n, nC >= 0, nC < m, board[nR][nC] == -1 {
                    count += 1
                    if count >= 2 {
                        board[cheese.r][cheese.c] = 0
                        spaces.append((cheese.r, cheese.c))
                        cheeses.remove(cheese)
                        break
                    }
                }
            }
        }
        for space in spaces {
            infectBFS(space)
        }
        spaces = []
        result += 1
    }

    return result
}

func infectBFS(_ start: (Int, Int)) {
    var queue = Queue()
    queue.enqueue(start)
    board[start.0][start.1] = -1

    while !queue.isEmpty {
        let (cR, cC) = queue.dequeue()!

        for (dr, dc) in directions {
            let nR = cR + dr
            let nC = cC + dc
            
            if nR >= 0, nR < n, nC >= 0, nC < m, board[nR][nC] == 0 {
                board[nR][nC] = -1
                queue.enqueue((nR, nC))
            }
        }
    }
}

struct Cheese: Hashable {
    let r: Int
    let c: Int
}

struct Queue {
    var inStack = [(Int, Int)]()
    var outStack = [(Int, Int)]()

    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }

    mutating func enqueue(_ element: (Int, Int)) {
        inStack.append(element)
    }

    mutating func dequeue() -> (Int, Int)? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}
