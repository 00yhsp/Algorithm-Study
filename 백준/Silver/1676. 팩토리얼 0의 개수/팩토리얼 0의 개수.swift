let n = Int(readLine()!)!

var count = 0
var divisor = 5

while n >= divisor {
    count += n / divisor
    divisor *= 5
}

print(count)
