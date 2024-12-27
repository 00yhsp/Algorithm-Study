let arr = readLine()!.split(separator: " ").map { Int($0)! }
print(arr.reduce(0) {$0 + $1})
