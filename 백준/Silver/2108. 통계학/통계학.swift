import Foundation

let n = Int(readLine()!)!

var arr = [Int]()
var dict = [Int: Int]()

for _ in 1...n {
    let num = Int(readLine()!)!
    arr.append(num)
    dict[num, default: 0] += 1
}

arr.sort()

let mean = Int(round(Double(arr.reduce(0, +)) / Double(n)))

let median = arr[n / 2]

let max = dict.values.max()!
let modes = dict.filter { $0.value == max }.keys.sorted()
let mode = modes.count > 1 ? modes[1] : modes.first!

let range = arr.last! - arr.first!

print(mean)
print(median)
print(mode)
print(range)
