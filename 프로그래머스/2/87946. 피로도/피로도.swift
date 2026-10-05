import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ tired: Int, _ depth: Int) {
        result = max(result, depth)
        for i in dungeons.indices {
            if visited[i] { continue }
            if dungeons[i][0] > tired { continue }
            visited[i] = true
            dfs(tired - dungeons[i][1], depth + 1)
            visited[i] = false
        }
    }

    dfs(k, 0)
    return result
}