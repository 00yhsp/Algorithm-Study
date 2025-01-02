let n = Int(readLine()!)!
var arr = [(Int, Int, Int, Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((input[0], input[1], i, 0))
}

for i in 0..<n {
    var count = 1
    for j in 0..<n {
        if arr[i].0 < arr[j].0 && arr[i].1 < arr[j].1 { count += 1 }
    }
    arr[i].3 = count
}

arr.sort { $0.2 < $1.2 }

let output = arr.map { "\($0.3)" }.joined(separator: " ")
print(output)
