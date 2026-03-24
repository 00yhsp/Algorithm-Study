let n = Int(readLine()!)!
var arr = [0]
var dp = [Int](repeating: 0, count: 10001)
for _ in 0..<n { arr.append(Int(readLine()!)!) }

dp[1] = arr[1]

if n >= 2 { dp[2] = arr[1] + arr[2] }
if n >= 3 { dp[3] = max(arr[1] + arr[3], arr[2] + arr[3]) }
if n >= 4 {
    for i in 4...n {
        dp[i] = max(dp[i - 3] + arr[i - 1] + arr[i], dp[i - 2] + arr[i])
    }
}

print(dp[n])
