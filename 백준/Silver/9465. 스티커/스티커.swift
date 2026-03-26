let T = Int(readLine()!)!

for _ in 0..<T {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)
    arr.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    arr.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    dp[0][0] = arr[0][0]
    dp[1][0] = arr[1][0]
    for i in 1..<n {
        dp[0][i] = max(dp[0][i - 1], dp[1][i - 1] + arr[0][i])
        dp[1][i] = max(dp[1][i - 1], dp[0][i - 1] + arr[1][i])
    }

    print(max(dp[0][n - 1], dp[1][n - 1]))
}