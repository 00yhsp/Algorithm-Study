import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)
dp[1] = 1; dp[2] = 3; dp[3] = 5;
if n < 4 { print(dp[n]); exit(0) }
for i in 4...n {
    dp[i] = (dp[i - 1] + 2 * dp[i - 2]) % 10007
}

print(dp[n])
