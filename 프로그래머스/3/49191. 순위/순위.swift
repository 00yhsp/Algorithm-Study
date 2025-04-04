import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var wins = Array(
        repeating: Array(repeating: false, count: n + 1),
        count: n + 1
    )
    
    for result in results {
        let winner = result[0]
        let loser = result[1]
        wins[winner][loser] = true
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if wins[i][k] && wins[k][j] {
                    wins[i][j] = true
                }
            }
        }
    }
    
    var answer = 0
    for i in 1...n {
        var count = 0
        for j in 1...n {
            if i == j { continue }
            if wins[i][j] || wins[j][i] {
                count += 1
            }
        }
        if count == n - 1 { answer += 1 }
    }
    
    return answer
}