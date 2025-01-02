let n = Int(readLine()!)!
var arr = [(Int, Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((input[0], input[1]))
}

arr.sort {
    if $0.1 < $1.1 {
        return true
    } else if $0.1 > $1.1 {
        return false
    } else {
        return $0.0 < $1.0 ? true : false
    }
}

var output = ""
arr.forEach { output += "\($0.0) \($0.1)\n" }
print(output, terminator: "")
