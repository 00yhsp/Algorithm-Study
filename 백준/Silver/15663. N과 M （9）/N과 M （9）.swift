let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var visited = Array(repeating: false, count: n + 1)
var nodes = [Int]()

backtrack()

func backtrack() {
    if nodes.count == m {
        print(nodes.map { String($0) }.joined(separator: " "))
        return
    }
    var last = 0
    for i in 0..<n {
        if !visited[i] && last != arr[i]  {
            visited[i] = true
            last = arr[i]
            nodes.append(arr[i])
            backtrack()
            nodes.removeLast()
            visited[i] = false
        }
    }
}
