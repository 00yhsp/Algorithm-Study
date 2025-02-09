let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var ascDP = Array(repeating: 1, count: n)
var descDP = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            ascDP[i] = max(ascDP[i], ascDP[j] + 1)
        }
    }
}

for i in stride(from: n - 1, through: 0, by: -1) {
    for j in stride(from: n - 1, through: i + 1, by: -1) {
        if arr[i] > arr[j] {
            descDP[i] = max(descDP[i], descDP[j] + 1)
        }
    }
}

var result = 0
for i in 0..<n {
    result = max(result, ascDP[i] + descDP[i] - 1)
}

print(result)
