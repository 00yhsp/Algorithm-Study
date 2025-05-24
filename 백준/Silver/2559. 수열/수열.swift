let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, k) = (nk[0], nk[1])
let arr = [0] + readLine()!.split(separator: " ").compactMap { Int($0) }
var psArr = [Int](repeating: 0, count: n + 1)
for i in 1...n { psArr[i] = psArr[i - 1] + arr[i] }
var result = -Int.max
for i in k...n { result = max(psArr[i] - psArr[i - k], result) }
print(result)