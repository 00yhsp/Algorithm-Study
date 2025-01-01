let t = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: 15), count: 15)
dp[0] = Array(1...15)
for i in 0..<15 { dp[i][0] = 1 }

for i in 1..<15 {
    for j in 1..<15 {
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
    }
}

for _ in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    print(dp[k][n - 1])
}
