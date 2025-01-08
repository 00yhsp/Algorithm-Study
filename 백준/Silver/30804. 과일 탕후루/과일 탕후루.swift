let n = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int($0)! }
var dict = [Int: Int]()

var start = 0
var result = 0

for end in 0..<n {
    dict[arr[end], default: 0] += 1

    while dict.keys.count > 2 {
        dict[arr[start]]! -= 1
        if dict[arr[start]] == 0 { dict[arr[start]] = nil }
        start += 1
    }
    result = max(result, end - start + 1)
}

print(result)
