let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0], m = nm[1]
var arr = [Array(repeating: 0, count: n + 1)]
for _ in 0..<n { arr.append([0] + readLine()!.split(separator: " ").map{ Int($0)! }) }
var sArr = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)

for x in 1...n {
    for y in 1...n {
        sArr[x][y] = sArr[x - 1][y] + sArr[x][y - 1] + arr[x][y] - sArr[x - 1][y - 1]
    }
}

for _ in 0..<m {
    let x1y1x2y2 = readLine()!.split(separator: " ").map{ Int($0)! }
    let x1 = x1y1x2y2[0], y1 = x1y1x2y2[1], x2 = x1y1x2y2[2], y2 = x1y1x2y2[3]
    let sum = sArr[x2][y2] - sArr[x2][y1 - 1] - sArr[x1 - 1][y2] + sArr[x1 - 1][y1 - 1]
    print(sum)
}

