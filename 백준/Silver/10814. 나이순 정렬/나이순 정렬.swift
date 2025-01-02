let n = Int(readLine()!)!
var arr = [(Int, String, Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ")
    arr.append( (Int(input[0])!, String(input[1]), i) )
}

arr.sort {
    if $0.0 < $1.0 { return true }
    if $0.0 > $1.0 { return false }
    if $0.2 < $1.2 { return true }
    return false
}

arr.forEach { print("\($0.0) \($0.1)") }
