import Foundation

let n = Int(readLine()!)!
let rows = n
let cols = 2 * n - 1
let totalCols = cols + 1

var buf = [UInt8](repeating: 32, count: rows * totalCols)
for r in 0..<rows { buf[r * totalCols + cols] = 10 }

func draw(_ n: Int, _ r: Int, _ c: Int) {
    if n == 3 {
        buf[(r + 0) * totalCols + (c + 2)] = 42
        buf[(r + 1) * totalCols + (c + 1)] = 42
        buf[(r + 1) * totalCols + (c + 3)] = 42
        for i in 0..<5 { buf[(r + 2) * totalCols + (c + i)] = 42 }
        return
    }

    let half = n / 2
    draw(half, r, c + half)
    draw(half, r + half, c)
    draw(half, r + half, c + half * 2)
}

draw(n, 0, 0)
FileHandle.standardOutput.write(Data(buf))
