import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let rates = [10, 20, 30, 40]
    let m = emoticons.count
    let n = users.count
    
    var discounted = Array(repeating: Array(repeating: 0, count: rates.count), count: m)
    for i in 0..<m {
        let price = emoticons[i]
        for (k, r) in rates.enumerated() {
            discounted[i][k] = price * (100 - r) / 100
        }
    }
    
    var bestSubscribers = -1
    var bestRevenue = -1
    var chosen = Array(repeating: 0, count: m)
    
    func evaluate() {
        var subscribers = 0
        var revenue = 0
        
        for u in 0..<n {
            let minRate = users[u][0]
            let limit   = users[u][1]
            var sum = 0
            
            for i in 0..<m {
                let rateIdx = chosen[i]
                if rates[rateIdx] >= minRate {
                    sum += discounted[i][rateIdx]
                }
            }
            if sum >= limit {
                subscribers += 1     
            } else {
                revenue += sum       
            }
        }
        
        if subscribers > bestSubscribers || (subscribers == bestSubscribers && revenue > bestRevenue) {
            bestSubscribers = subscribers
            bestRevenue = revenue
        }
    }
    
    func dfs(_ idx: Int) {
        if idx == m {
            evaluate()
            return
        }
        for k in 0..<rates.count {
            chosen[idx] = k
            dfs(idx + 1)
        }
    }
    
    dfs(0)
    return [bestSubscribers, bestRevenue]
}
