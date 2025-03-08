let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let (v, e) = (ve[0], ve[1])

var edges = [(Int, Int, Int)]()
var ds = DisjointSet(v)
var result = 0

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").compactMap { Int($0) }
    edges.append((abc[0], abc[1], abc[2]))
}

edges.sort { $0.2 < $1.2 }

for edge in edges {
    if ds.find(edge.0) == ds.find(edge.1) { continue }
    ds.union(edge.0, edge.1)
    result += edge.2
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
        if parent[x] != x { parent[x] = find(parent[x]) }
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