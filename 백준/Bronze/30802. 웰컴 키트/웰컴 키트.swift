let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int($0)! }

let tempArr = readLine()!.split(separator: " ").map { Int($0)! }
let (t, p) = (tempArr[0], tempArr[1])

var tCount = 0

arr.forEach {
    let (q, r) = $0.quotientAndRemainder(dividingBy: t)
    if r > 0 {
        tCount += q + 1
    } else {
        tCount += q
    }
}

let (q, r) = n.quotientAndRemainder(dividingBy: p)

print(tCount)
print("\(q) \(r)")
