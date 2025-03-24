import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    let n = 24
    var serverAdditions = [(remaining: Int, count: Int)]()
    var result = 0
    
    for i in 0..<n {
        let expandedServer = serverAdditions.reduce(0) { $0 + $1.count }
        let requiredServer = max(players[i] / m - expandedServer, 0)
        serverAdditions.append((k, requiredServer))
        result += requiredServer
        serverAdditions = serverAdditions
                            .map { ($0.0 - 1, $0.1) }
                            .filter { $0.0 != 0 }
        
    }
    return result
}