let n = Int(readLine()!)!
var board = [[Int]]()
var white = 0
var blue = 0

board.append(Array(repeating: 0, count: n + 1))
for _ in 0..<n { board.append([0] + readLine()!.split(separator: " ").map { Int($0)! }) }

divideAndConquer(1, 1, size: n)
print(white)
print(blue)

func divideAndConquer(_ x: Int, _ y: Int, size: Int) {
    var whiteCount = 0
    var blueCount = 0
    
    outerLoop: for j in y..<y+size {
        for i in x..<x+size {
            if board[j][i] == 0 { whiteCount += 1 }
            else { blueCount += 1 }
            if whiteCount != 0 && blueCount != 0 {
                break outerLoop
            }
        }
    }

    if whiteCount != 0 && blueCount != 0 {
        divideAndConquer(x, y, size: size / 2)
        divideAndConquer(x + size / 2, y, size: size / 2)
        divideAndConquer(x, y + size / 2, size: size / 2)
        divideAndConquer(x + size / 2, y + size / 2, size: size / 2)
    } else if blueCount == 0 {
        white += 1
    } else {
        blue += 1
    }
}
