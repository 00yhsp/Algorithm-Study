let str1 = Array(readLine()!)
let str2 = Array(readLine()!)

let len1 = str1.count
let len2 = str2.count

var previous = [Int](repeating: 0, count: len2 + 1)
var current = [Int](repeating: 0, count: len2 + 1)

for i in 1...len1 {
    for j in 1...len2 {
        if str1[i - 1] == str2[j - 1] { current[j] = previous[j - 1] + 1 }
        else { current[j] = max(previous[j], current[j - 1]) }
    }
    previous = current
}

print(current[len2])