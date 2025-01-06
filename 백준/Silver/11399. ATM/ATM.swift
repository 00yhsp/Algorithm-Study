let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var sumArr = Array(repeating: 0, count: n)
sumArr[0] = arr[0]

for i in 1..<n { sumArr[i] = sumArr[i-1] + arr[i] }

print(sumArr.reduce(0, +))
