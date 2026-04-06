let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
var start = 0; var end = 0
var partialSum = arr[0]
var count = 0

while true {
    if partialSum >= m {
        if partialSum == m { count += 1 }
        partialSum -= arr[start]
        start += 1
    } else {
        if end == n - 1 { break }
        end += 1
        partialSum += arr[end]
    }
}
print(count)