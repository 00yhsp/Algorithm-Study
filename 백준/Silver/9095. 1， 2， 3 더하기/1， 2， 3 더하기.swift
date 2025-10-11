var dp = [Int](repeating: 0, count: 12)
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...11 {
    dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let n = Int(readLine()!)!
    print(dp[n])
}