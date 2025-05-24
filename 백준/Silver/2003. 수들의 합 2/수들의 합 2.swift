let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var start = 0
var end = 0
var sum = arr[0]
var cnt = 0

while true {
    if sum == m {
        cnt += 1
        sum -= arr[start]
        start += 1
    } else if sum < m {
        if end + 1 == n { break }
        end += 1
        sum += arr[end]
    } else {
        sum -= arr[start]
        start += 1
    }
}
print(cnt)