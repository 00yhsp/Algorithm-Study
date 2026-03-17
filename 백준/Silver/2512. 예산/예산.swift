let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = Int(readLine()!)!

if arr.reduce(0, +) <= m { 
    print(arr.max()!) 
} else {
    print(binarySearch())
}

func binarySearch() -> Int {
    var start = 0; var end = 1_000_000_000

    while start <= end {
        let mid = (start + end) / 2
        let sum = arr.reduce(0) { $0 + ($1 <= mid ? $1 : mid) }

        if sum <= m {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    return end
}