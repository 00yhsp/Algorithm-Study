let n = Int(readLine()!)!
var dp = Array(repeating: Int.max, count: 50001)
dp[0] = 0; dp[1] = 1; dp[2] = 2; dp[3] = 3; dp[4] = 1
let limit = max(5, n)
for i in 5...limit {
    var j = 1
    while j * j <= i {
        dp[i] = min(dp[i], dp[i - j * j] + 1)
        j += 1
    }
}
print(dp[n])
