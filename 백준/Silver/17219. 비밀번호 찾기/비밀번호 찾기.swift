let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var dict = [String: String]()
var output = ""

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let k = input[0], v = input[1]
    dict[k] = v
}
for _ in 0..<m {
    let input = readLine()!
    output += dict[input]! + "\n"
}
print(output, terminator: "")
