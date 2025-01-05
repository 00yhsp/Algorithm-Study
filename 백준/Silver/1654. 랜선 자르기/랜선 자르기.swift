let input = readLine()!.split(separator: " ").map { Int($0)! }
let k = input[0], n = input[1]

var arr = [Int]()
for _ in 1...k { arr.append(Int(readLine()!)!) }
arr.sort()

var start = 1
var end = arr.max()!

while start <= end {
    let mid = (start + end) / 2

    var count = 0
    for elem in arr { count += elem / mid }

    if count >= n { start = mid + 1 }
    else { end = mid - 1 }
}

print(end)
