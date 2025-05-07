let n = Int(readLine()!)!
let INF = 1_000_001

var cost = [[Int]]()
var dp = [[Int]](repeating: [0, 0, 0], count: n)
var result = INF

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    cost.append(input)
}

for j in 0..<3 {
    let a = (j + 1) % 3
    let b = (j + 2) % 3
    dp[0][j] = cost[0][j]; dp[0][a] = INF; dp[0][b] = INF

    for i in 1..<n {
        dp[i][j] = min(dp[i - 1][a], dp[i - 1][b]) + cost[i][j]
        dp[i][a] = min(dp[i - 1][j], dp[i - 1][b]) + cost[i][a]
        dp[i][b] = min(dp[i - 1][j], dp[i - 1][a]) + cost[i][b]
    }

    result = min(result, dp[n - 1][a], dp[n - 1][b])
}

print(result)
