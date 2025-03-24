import Foundation

func solution(_ info: [[Int]], _ n: Int, _ m: Int) -> Int {
    let count = info.count
    var dp = Array(
                repeating: Array(
                    repeating: Array(
                        repeating: Int.max, 
                        count: m + 1
                    ), 
                    count: n + 1
                ), 
                count: count + 1
            )
    dp[0][0][0] = 0
    var result = Int.max
    
    for depth in 0..<count {
        for a in 0...n {
            for b in 0...m {
                if dp[depth][a][b] == Int.max { continue }
                
                let nextA = a + info[depth][0]
                let nextB = b + info[depth][1]
                
                if nextA < n {
                    dp[depth + 1][nextA][b] = min(dp[depth + 1][nextA][b], dp[depth][a][b])
                }
                if nextB < m {
                    dp[depth + 1][a][nextB] = min(dp[depth + 1][a][nextB], dp[depth][a][b])
                }
            }
        }
    }

    for a in 0...n {
        for b in 0...m {
            if dp[count][a][b] != Int.max {
                result = min(result, a)
            }
        }
    }
    
    return result == Int.max ? -1 : result
}