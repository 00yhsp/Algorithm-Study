let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var seq = [Int]()
backtrack(1)
func backtrack(_ start: Int) {
    if seq.count == m {
        seq.forEach { print($0, terminator: " ") }
        print()
        return
    }
    if start > n { return }
    for i in start...n {
        seq.append(i)
        backtrack(i + 1)
        _ = seq.popLast()
    }
}