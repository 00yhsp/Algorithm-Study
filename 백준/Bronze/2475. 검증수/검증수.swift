import Foundation

var sum: Int = 0

let arr = readLine()!.split(separator: " ").map { Double($0)! }

for elem in arr {
    sum += Int(pow(elem, 2))
}

let remainder = sum % 10

print(remainder)
