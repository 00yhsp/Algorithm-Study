let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var dict = [String: Int]()

for _ in 0..<n {
    let input = readLine()!
    dict[input, default: 0] += 1
}
for _ in 0..<m {
    let input = readLine()!
    dict[input, default: 0] += 1
}
let result = dict.filter { $0.value > 1 }.keys.sorted()
print(result.count)
print(result.joined(separator: "\n"))
