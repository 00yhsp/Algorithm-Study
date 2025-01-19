let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]

var weight = Array(repeating: 0, count: n + 1)
var value = Array(repeating: 0, count: n + 1)

var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

for i in 1...n {
    let wv = readLine()!.split(separator: " ").map { Int($0)! }
    weight[i] = wv[0]
    value[i] = wv[1]
}

for i in 1...n {
    if weight[i] > k {
        for w in 1...k { dp[i][w] = dp[i - 1][w] }
    } else {
        for w in 1..<weight[i] { dp[i][w] = dp[i - 1][w] }
        for w in weight[i]...k { dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weight[i]] + value[i]) }
    }
}

print(dp[n][k])
