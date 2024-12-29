let nx = readLine()!.split(separator: " ").map { Int($0)! }
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var output = ""

for elem in arr {
    if elem < nx[1] { output.append("\(elem) ") }
}

_ = output.popLast()

print(output)
