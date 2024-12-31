import Foundation

_ = readLine()

let arr = readLine()!.map { UInt64($0.asciiValue!) - 96 }

var sum: UInt64 = 0

for i in 0..<arr.count {
    var pow: UInt64 = 1
    for _ in 0..<i { pow = (pow * 31) % 1234567891 }
    pow = (arr[i] * pow) % 1234567891
    sum = (sum + pow) % 1234567891
}

print(sum)
