let input = Array(readLine()!)

var temp = 0
var sum = 0

// 위치
for i in 1..<input.count {
    if input[i] == "(" && input[i - 1] == "(" {
        temp += 1
    } else if input[i] == ")" && input[i - 1] == ")" {
        sum += temp
    }
}

print(sum)