let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var arr = [Int]()
for _ in 0..<n { arr.append(Int(readLine()!)!) }
arr.sort()
var start = 0; var end = 0
var result = Int.max
while true {
    if arr[end] - arr[start] >= m {
        if start == n - 1 { break }
        result = min(result, arr[end] - arr[start])
        start += 1
    } else {
        if end == n - 1 { break }
        end += 1
    }
}
print(result)