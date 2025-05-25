import Foundation

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    var visited = [Bool](repeating: false, count: n + 1)
    var result = 0
    var q = q.map { Set<Int>($0) }
    
    func backtrack(_ s: Set<Int>, _ startIdx: Int) {
        for (idx, inputs) in q.enumerated() {
            if inputs.intersection(s).count > ans[idx] {
                return
            }
        }
        if s.count == 5 { 
            for (idx, inputs) in q.enumerated() {
                if inputs.intersection(s).count != ans[idx] {
                    return
                }
            }
            result += 1
            return
        }
        if startIdx > n { return }
        
        var s = s
        
        for i in startIdx...n {
            if visited[i] { continue }
            visited[i] = true
            s.insert(i)
            backtrack(s, i + 1)
            s.remove(i)
            visited[i] = false
        }
    }
    
    backtrack(Set<Int>(), 1)
    
    return result
}

// 정수 범위 1~n | 10 <= n <= 30
// 양의 정수 오름차순 5개의 배열 q
    // 1 <= q.count <= 10 
    // q[i].count == 5
// 일치 수 배열 ans
    // 1 <= ans.count <= 5