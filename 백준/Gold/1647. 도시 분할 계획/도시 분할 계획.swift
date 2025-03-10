let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])

var selected = [Bool](repeating: false, count: m)
var edges = [(Int, Int, Int)]()
var ds = DisjointSet(n)
var result = 0

edges.reserveCapacity(m)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").compactMap { Int($0) }
    let edge = (abc[0], abc[1], abc[2])
    edges.append(edge)
}
edges.sort { $0.2 < $1.2 }

for (idx, edge) in edges.enumerated() {
    if ds.find(edge.0) == ds.find(edge.1) { continue }
    ds.union(edge.0, edge.1)
    result += edge.2
    selected[idx] = true
}

for i in stride(from: m - 1, through: 0, by: -1) {
    if selected[i] { 
        result -= edges[i].2
        break
    }
}

print(result)

struct DisjointSet {
    var parent: [Int]
    var rank: [Int]

    init(_ n: Int) {
        parent = [Int](0...n)
        rank = [Int](repeating: 0, count: n + 1)
    }

    mutating func find(_ x: Int) -> Int {
        if x != parent[x] { parent[x] = find(parent[x]) }
        return parent[x]
    }

    mutating func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        if rootA == rootB { return }

        if rank[rootA] < rank[rootB] {
            parent[rootA] = rootB
        } else if rank[rootA] > rank[rootB] {
            parent[rootB] = rootA
        } else {
            parent[rootB] = rootA
            rank[rootA] += 1
        }
    }
}