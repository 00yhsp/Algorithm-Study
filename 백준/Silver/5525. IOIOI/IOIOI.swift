let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = readLine()!.map { String($0) }

var count = 0
var ioi = 0
var pointer = 0

while pointer < m - 1 {
    if s[pointer] == "I" && s[pointer + 1] == "O" && pointer + 2 < m && s[pointer + 2] == "I" {
        ioi += 1
        if ioi >= n { count += 1 }
        pointer += 2
    } else {
        ioi = 0
        pointer += 1
    }
}

print(count)
