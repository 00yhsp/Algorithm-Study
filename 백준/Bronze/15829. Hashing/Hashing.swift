import Foundation

_ = readLine()

let arr = readLine()!.map { Int($0.asciiValue!) - 96 }

var sum = 0

for i in 0..<arr.count {
    sum += arr[i] * Int(pow(Double(31), Double(i)))
}

print(sum % 1234567891)
