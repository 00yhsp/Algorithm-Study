import Foundation

let n = Int(readLine()!)!

var num = 665
var count = 0

while count <= 10000 {
    num += 1

    var temp = num
    while temp >= 666 {
        if temp % 1000 == 666 {
            count += 1
            break
        }
        temp /= 10
    }

    if count == n {
        print(num)
        break
    }
}
