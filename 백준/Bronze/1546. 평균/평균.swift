let n = Double(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Double($0)! }
let max = arr.max()!
arr = arr.map { $0 / max * 100 }

print(arr.reduce(0, +) / n)
