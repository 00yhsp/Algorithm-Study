var dp = [Int](repeating: 0, count: 11)

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...10 {
    dp[i] = dp[i - 3] + dp[i - 2] + dp[i - 1]
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n])
}