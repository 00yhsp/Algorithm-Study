let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var count = 0

for i in 0..<n {
    var left = 0; var right = n - 1
    
    while left < right {
        if left == i {
            left += 1
            continue
        }
        if right == i {
            right -= 1
            continue
        }
        
        let s = arr[left] + arr[right]
        if s == arr[i] {
            count += 1
            break
        } else if s < arr[i] {
            left += 1
        } else {
            right -= 1
        }
    }
}

print(count)