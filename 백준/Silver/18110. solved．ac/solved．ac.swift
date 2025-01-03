import Foundation

let n = Int(readLine()!)!
var arr = [Int]()

if n == 0 {
    print(0)
    exit(0)
}

for _ in 0..<n { arr.append(Int(readLine()!)!) }
arr.sort()

let cut = Int(round(Double(n) * 0.15))

arr.removeFirst(cut)
arr.removeLast(cut)

print(Int(round(Double(arr.reduce(0, +)) / Double(arr.count))))
