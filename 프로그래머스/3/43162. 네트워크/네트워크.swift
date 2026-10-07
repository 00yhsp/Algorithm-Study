import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var graph = [Int: [Int]]()
    var visited = [Bool](repeating: false, count: n)
    var result = 0
    
    for r in 0..<n {
        for c in 0..<n where computers[r][c] == 1 {
            graph[r, default: []].append(c)
            graph[c, default: []].append(r)
        }
    }
    
    func dfs(_ idx: Int) {
        visited[idx] = true
        for nextNode in graph[idx, default: []] where !visited[nextNode] {
            dfs(nextNode)
        }
    }
    
    for i in 0..<n where !visited[i] {
        dfs(i)
        result += 1
    }
    
    return result
}