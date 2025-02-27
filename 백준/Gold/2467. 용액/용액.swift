let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

print(find())

func find() -> String {
    var left = 0
    var right = n - 1
    var best = Int.max
    var pair = (0, 0)

    while left < right {
        let sum = arr[left] + arr[right]
        if abs(sum) < abs(best) {
            best = sum
            pair = (arr[left], arr[right])
        }
        if sum < 0 {
            left += 1
        } else {
            right -= 1
        }
    }
    return "\(pair.0) \(pair.1)"
}
