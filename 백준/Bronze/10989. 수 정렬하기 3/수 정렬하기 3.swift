var arr = Array(repeating: 0, count: 10001)

let n = Int(readLine()!)!
for _ in 0..<n {
    let num = Int(readLine()!)!
    arr[num] += 1
}

var output = ""
for i in 1...10000 {
    if arr[i] != 0 {
        output += String(repeating: "\(i)\n", count: arr[i])
    }
}
print(output)
