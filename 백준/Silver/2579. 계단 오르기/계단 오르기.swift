import Foundation

let n = Int(readLine()!)!

var arr = [0]
var dp = Array(repeating: 0, count: n + 1)

for _ in 0..<n { arr.append(Int(readLine()!)!) }

if n == 1 { print(arr[1]); exit(0) }
if n == 2 { print(arr[1] + arr[2]); exit(0) }
if n == 3 { print(max(arr[1] + arr[3], arr[2] + arr[3])); exit(0) }
dp[1] = arr[1]; dp[2] = arr[1] + arr[2]; dp[3] = max(arr[1] + arr[3], arr[2] + arr[3])

for i in 4...n {
    dp[i] = max(dp[i - 3] + arr[i - 1] + arr[i], dp[i - 2] + arr[i])
}

print(dp[n])
