let nmb = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmb[0], m = nmb[1], b = nmb[2]
var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var (min, idx) = (Int.max, 0)

for i in 0...256 {
    var sum = 0, get = 0, put = 0
    for j in 0..<n {
        for k in 0..<m {
            if arr[j][k] > i { get += arr[j][k] - i }
            else { put += i - arr[j][k] }
        }
    }
    if put > get + b { continue }
    sum = put + 2 * get
    if sum <= min { min = sum; idx = i }
}

print(min, idx)
