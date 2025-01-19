let n = Int(readLine()!)!
var arr = [[Int32]]()
var maxDP = [[Int32]]()
var minDP = [[Int32]]()

for _ in 0..<n { arr.append(readLine()!.split(separator: " ").map { Int32($0)! }) }
maxDP.append(arr[0]); maxDP.append([0, 0, 0]); minDP.append(arr[0]); minDP.append([0, 0, 0])

for i in 1..<n {
    maxDP[1][0] = max(maxDP[0][0] + arr[i][0], maxDP[0][1] + arr[i][0])
    maxDP[1][1] = max(maxDP[0][0] + arr[i][1], maxDP[0][1] + arr[i][1], maxDP[0][2] + arr[i][1])
    maxDP[1][2] = max(maxDP[0][1] + arr[i][2], maxDP[0][2] + arr[i][2])
    minDP[1][0] = min(minDP[0][0] + arr[i][0], minDP[0][1] + arr[i][0])
    minDP[1][1] = min(minDP[0][0] + arr[i][1], minDP[0][1] + arr[i][1], minDP[0][2] + arr[i][1])
    minDP[1][2] = min(minDP[0][1] + arr[i][2], minDP[0][2] + arr[i][2])
    maxDP[0] = maxDP[1]; minDP[0] = minDP[1]
}

print(maxDP[0].max()!, minDP[0].min()!)
