struct Queue {
    private var inputStack = [(Int, Int)]()
    private var outputStack = [(Int, Int)]()
    
    mutating func enqueue(_ element: (Int, Int)) {
        inputStack.append(element)
    }
    
    mutating func dequeue() -> (Int, Int)? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.popLast()
    }
}

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var board = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)

for _ in 0..<k {
    let rc = readLine()!.split(separator: " ").compactMap { Int($0)! }
    let r = rc[0]
    let c = rc[1]
    board[r][c] = 1
}

let l = Int(readLine()!)!
var rotations = [Int: Int]()

for _ in 0..<l {
    let input = readLine()!.split(separator: " ")
    let x = Int(input[0])!
    let c = input[1]
    rotations[x] = (c == "L") ? -1 : 1
}

let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

var dir = 0
var cr = 1
var cc = 1

var snake = Queue()
snake.enqueue((1, 1))
board[1][1] = -1

for i in 1...10000 {
    let nr = cr + directions[dir].0
    let nc = cc + directions[dir].1
    if nr < 1 || nr > n || nc < 1 || nc > n || board[nr][nc] == -1 {
        print(i)
        break
    }
    
    if board[nr][nc] != 1, let tail = snake.dequeue() {
        board[tail.0][tail.1] = 0    
    }
    board[nr][nc] = -1
    snake.enqueue((nr, nc))
    
    cr = nr
    cc = nc
    
    if let rotation = rotations[i] { dir = (dir + rotation + 4) % 4 }
}