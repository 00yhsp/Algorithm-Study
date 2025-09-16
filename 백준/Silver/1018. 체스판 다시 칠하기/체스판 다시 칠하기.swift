let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

let white = [
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"]
]
let black = [
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"]
]

var arr: [[String]] = []
for _ in 0..<n {
    arr.append(readLine()!.map { String($0) })
}

var count = Int.max

for i in 0...(n - 8) {
    for j in 0...(m - 8) {
        var whiteCount = 0
        var blackCount = 0

        for k in 0..<8 {
            for l in 0..<8 {
                if arr[i + k][j + l] != white[k][l] {
                    whiteCount += 1
                }
                if arr[i + k][j + l] != black[k][l] {
                    blackCount += 1
                }
            }
        }

        count = min(count, whiteCount, blackCount)
    }
}

print(count)
