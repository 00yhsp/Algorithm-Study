let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var result = [Int]()

backtrack(1)

func backtrack(_ start: Int) {
    if result.count == m {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }
    if start > n { return }
    for i in start...n {
        result.append(i)
        backtrack(i)
        _ = result.popLast()
    }
}
