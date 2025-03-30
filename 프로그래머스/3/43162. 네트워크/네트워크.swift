import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: n)
    var graph = [Int: [Int]]()
    var result = 0
    
    for i in 0..<n {
        for j in 0..<computers[i].count {
            if i == j || computers[i][j] == 0 { continue }
            graph[i, default: []].append(j)
        }
    }
    
    func dfs(_ node: Int) {
        visited[node] = true
        
        for nextNode in graph[node, default: []] {
            if !visited[nextNode] {
                dfs(nextNode)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] { 
            dfs(i) 
            result += 1
        }
    }
    return result
}