let n = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<n { arr.append(Int(readLine()!)!) }

arr.sort()

var output = ""

for elem in arr { output += "\(elem)\n" }

print(output, terminator: "")
