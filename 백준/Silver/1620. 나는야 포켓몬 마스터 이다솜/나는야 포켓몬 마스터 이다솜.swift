let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var idxDict = [Int: String]()
var nameDict = [String: Int]()
var output = ""

for i in 1...n {
    let name = readLine()!
    idxDict[i] = name
    nameDict[name] = i
}
for _ in 0..<m {
    let input = readLine()!
    if let num = Int(input) {
        output += "\(idxDict[num]!)\n"
    } else {
        output += "\(nameDict[input]!)\n"
    }
}
print(output, terminator: "")
