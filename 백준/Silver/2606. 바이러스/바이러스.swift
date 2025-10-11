let n = Int(readLine()!)!
let e = Int(readLine()!)!
var graph = [Int: [Int]]()
var result = 0
var visited = [Bool](repeating: false, count: n + 1)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0], default: []].append(input[1])
    graph[input[1], default: []].append(input[0])
}
dfs(1)
print(result)


func dfs(_ x: Int) {
    visited[x] = true
    for next in graph[x, default: []] {
        if !visited[next] { 
            result += 1
            dfs(next) 
        }
    }
}