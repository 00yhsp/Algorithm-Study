let t = Int(readLine()!)!

var dp = Array(repeating: (0, 0), count: 41)
dp[0] = (1, 0); dp[1] = (0, 1)

for i in 2...40 {
    dp[i] = (dp[i - 1].0 + dp[i - 2].0, dp[i - 1].1 + dp[i - 2].1)
}

var output = ""
for _ in 0..<t {
    let n = Int(readLine()!)!
    let result = dp[n]
    output += "\(result.0) \(result.1)\n"
}
print(output, terminator: "")
