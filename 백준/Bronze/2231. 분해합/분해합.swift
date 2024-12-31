let n = Int(readLine()!)!

var result = 0

for i in 1...n {
    let str = String(i)
    var sum = i

    for elem in str {
        let num = Int(String(elem))!
        sum += num
    }
    if n == sum {
        result = i
        break
    }
}

print(result)
