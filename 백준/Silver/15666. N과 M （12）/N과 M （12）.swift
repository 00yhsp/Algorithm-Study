let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let arr = Array(Set(readLine()!.split(separator: " ").map { Int($0)! })).sorted()
let count = arr.count
var visited = Array(repeating: false, count: arr.count + 1)
var nodes = [Int]()

backtrack(0)

func backtrack(_ start: Int) {
    if nodes.count == m {
        print(nodes.map { String($0) }.joined(separator: " "))
        return
    }
    if start > count { return }
    for i in start..<count {
        nodes.append(arr[i])
        backtrack(i)
        nodes.removeLast()
    }
}
