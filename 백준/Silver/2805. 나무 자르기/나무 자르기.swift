let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var start = 0, end = arr.max()!

binarySearch()

func binarySearch() {
    while start <= end {
        let mid = (start + end) / 2
        let sum = arr.reduce(0) { $0 + ($1 > mid ? $1 - mid : 0) }
        if sum >= m {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    print(end)
}
