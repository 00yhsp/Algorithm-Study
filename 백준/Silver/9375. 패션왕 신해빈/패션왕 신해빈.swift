let t = Int(readLine()!)!
var output = ""

for _ in 0..<t {
    let n = Int(readLine()!)!
    var dict = [String: Int]()
    var result = 1
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ")
        let key = String(input[1])
        dict[key, default: 0] += 1
    }
    dict.values.forEach { result *= ($0 + 1) }
    output += "\(result - 1)\n"
}
print(output, terminator: "")
