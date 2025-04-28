let str1 = Array(readLine()!)
let str2 = Array(readLine()!)
let n = str1.count, m = str2.count
var lcsChars = [Character]()
var i = n, j = m

var dp = Array(
    repeating: Array(repeating: 0, count: m + 1),
    count: n + 1
)

for i in 1...n {
    for j in 1...m {
        if str1[i - 1] == str2[j - 1] {
            dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
    }
}

print(dp[n][m])

while i > 0 && j > 0 {
    if str1[i - 1] == str2[j - 1] {
        lcsChars.append(str1[i - 1])
        i -= 1
        j -= 1
    } else if dp[i - 1][j] > dp[i][j - 1] {
        i -= 1
    } else {
        j -= 1
    }
}

lcsChars.reverse()
if !lcsChars.isEmpty { print(String(lcsChars)) }