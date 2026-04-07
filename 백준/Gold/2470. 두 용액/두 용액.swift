let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var start = 0; var end = n - 1;
var result1 = arr[start]; var result2 = arr[end]
while start < end {
    if abs(result1 + result2) > abs(arr[start] + arr[end]) {
        result1 = arr[start]; result2 = arr[end]   
    }
    if arr[start] + arr[end] < 0 {
        start += 1
    } else {
        end -= 1
    }
}

print(result1, result2)
