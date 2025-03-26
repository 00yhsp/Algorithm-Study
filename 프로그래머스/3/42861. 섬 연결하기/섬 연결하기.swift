import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var edges = costs.sorted { $0[2] < $1[2] }
    var ds = DisjointSet(n)
    var result = 0
    
    for edge in edges {
        let a = edge[0], b = edge[1]
        let cost = edge[2]
        
        if ds.find(a) == ds.find(b) { continue }
        ds.union(a, b)
        result += cost
    }
    return result
}

struct DisjointSet {
    var parent: [Int]
    var rank: [Int]
    
    init(_ n: Int) {
        parent = Array(0...n)
        rank = [Int](repeating: 1, count: n + 1)
    }
    
    mutating func find(_ x: Int) -> Int {
        if x != parent[x] { parent[x] = find(parent[x]) }
        return parent[x]
    }
    
    mutating func union(_ a: Int, _ b: Int) {
        let rootA = parent[a]
        let rootB = parent[b]
        
        if rootA == rootB { return }
        
        if rank[rootA] < rank[rootB] {
            parent[rootA] = rootB
        } else if rank[rootB] < rank[rootB] {
            parent[rootB] = rootA
        } else {
            parent[rootB] = rootA
            rank[rootB] += 1
        }
    }
}
// cost 주어짐
// 최소 비용으로 모든 섬이 서로 통행 가능하도록 만들 때 필요한 최소 비용
// 섬의 개수 1 <= n <= 100
// cost[i][0] cost[i][1] 두 섬의 번호 cost[i][2] 비용
// 같은 연결 두 번 주어지지 않음
