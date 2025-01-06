let n = Int(readLine()!)!
let vertices = Int(readLine()!)!
var dict = [Int:[Int]]()
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<vertices {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], m = input[1]
    dict[n, default: []].append(m)
    dict[m, default: []].append(n)
}

dfs(1)
visited[1] = false
print(visited.filter { $0 }.count)

func dfs(_ v: Int) {
    visited[v] = true
    for node in dict[v, default: []] {
        if !visited[node] { dfs(node) }
    }
}
