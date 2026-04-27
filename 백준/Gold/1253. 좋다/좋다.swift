let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var count = 0

for i in 0..<n {
    var start = 0; var end = n - 1
    
    while start < end {
        if start == i {
            start += 1
            continue
        }
        if end == i {
            end -= 1
            continue
        }
        
        let s = arr[start] + arr[end]
        if s == arr[i] {
            count += 1
            break
        } else if s < arr[i] {
            start += 1
        } else {
            end -= 1
        }
    }
}

print(count)