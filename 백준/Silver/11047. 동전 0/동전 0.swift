let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]; var k = nk[1]
var stack = [Int]()
var count = 0

for _ in 1...n { stack.append(Int(readLine()!)!) }

while k > 0 {
    let top = stack.popLast()!
    if top > k { continue }
    let (q, r) = k.quotientAndRemainder(dividingBy: top)
    count += q
    k = r
}
print(count)
