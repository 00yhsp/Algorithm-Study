let kn = readLine()!.split(separator: " ").compactMap { Int($0) }
let (k, n) = (kn[0], kn[1])
var arr = [Int]()
for _ in 0..<k { arr.append(Int(readLine()!)!) }

var start = 1; var end = arr.max()!

while start <= end {
    let mid = (start + end) / 2
    let count = arr.reduce(0) { $0 + $1 / mid }

    if count >= n {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)