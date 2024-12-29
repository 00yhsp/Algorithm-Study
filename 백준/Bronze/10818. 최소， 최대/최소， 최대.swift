_ = readLine()

let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

print("\(arr.first!) \(arr.last!)")
