print(detectCycle())

func detectCycle() -> Int {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m) = (nm[0], nm[1])
    var ds = DisjointSet(n: n)

    for i in 1...m {
        let ab = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (a, b) = (ab[0], ab[1])
        if ds.find(a) == ds.find(b) { return i }
        ds.union(a, b)
    }

    return 0
}

struct DisjointSet {
    var parent: [Int]
    var rank: [Int]

    init(n: Int) {
        parent = Array(0...n)
        rank = Array(repeating: 0, count: n + 1)
    }

    mutating func find(_ x: Int) -> Int {
        if parent[x] != x { parent[x] = find(parent[x]) }
        return parent[x]
    }

    mutating func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        
        if rootA == rootB { return }
        
        if rank[rootA] < rank[rootB] { parent[rootA] = rootB }
        else if rank[rootA] > rank[rootB] { parent[rootB] = rootA }
        else {
            parent[rootB] = rootA
            rank[rootA] += 1
        }
    }
}
