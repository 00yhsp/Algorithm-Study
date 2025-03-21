import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    
    func backTrack(_ available: Int, _ routes: Int) {
        result = max(routes, result)
        
        for i in 0..<dungeons.count {
            let require = dungeons[i][0]
            let cost = dungeons[i][1]
            
            if !visited[i] && available >= require {
                visited[i] = true
                backTrack(available - cost, routes + 1)
                visited[i] = false
            }
        }
    }
    
    backTrack(k, 0)
    
    return result
}