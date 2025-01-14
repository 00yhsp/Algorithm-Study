let n = Int(readLine()!)!
var arr = [(Int, Int)]()
var current = 0
var count = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((input[0], input[1]))
}

arr.sort { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }

for (start, end) in arr {
    if current <= start {
        current = end
        count += 1
    }
}

print(count)
