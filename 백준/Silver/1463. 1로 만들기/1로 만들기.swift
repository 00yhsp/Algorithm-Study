import Foundation

let n = Int(readLine()!)!
if n == 1 { print(0); exit(0) }
if n == 2 { print(1); exit(0) }
if n == 3 { print(1); exit(0) }
var dp = Array(repeating: 0, count: n + 1)
dp[1] = 0; dp[2] = 1; dp[3] = 1

for i in 4...n { getDP(i) }
print(dp[n])

func getDP(_ n: Int) {
    dp[n] = dp[n - 1] + 1
    if n.isMultiple(of: 2) {
        dp[n] = min(dp[n / 2] + 1, dp[n])
    }
    if n.isMultiple(of: 3) {
        dp[n] = min(dp[n / 3] + 1, dp[n])
    }
}
