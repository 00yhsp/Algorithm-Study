let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int($0)! }
var dict = [Int: Int]()

for elem in arr { dict[elem] = (dict[elem] ?? 0) + 1 }

_ = readLine()
let arr2 = readLine()!.split(separator: " ").map { Int($0)! }

var output = [Int]()
for elem in arr2 { output.append(dict[elem] ?? 0) }
print(output.map { String($0) }.joined(separator: " "))
