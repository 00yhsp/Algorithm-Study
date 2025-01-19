let s1 = Array(readLine()!)
let s2 = Array(readLine()!)

let n = s1.count
let m = s2.count

var previous = Array(repeating: 0, count: m + 1)
var current = Array(repeating: 0, count: m + 1)
for i in 1...n {
    for j in 1...m {
        if s1[i - 1] == s2[j - 1] {
            current[j] = previous[j - 1] + 1
        } else {
            current[j] = max(previous[j], current[j - 1])
        }
    }
    previous = current
}

print(current[m])
