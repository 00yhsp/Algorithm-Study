let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

let input = readLine()!.split(separator: " ").map { Int($0)! }
let t = input.first!
var truth: [Int] = []
if t > 0 { truth = Array(input.dropFirst()) }

var parties = [[Int]]()
parties.reserveCapacity(m)

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let participants = Array(line.dropFirst())
    parties.append(participants)
}

var ds = DisjointSet(n)

for party in parties {
    if party.count > 1 {
        for i in 1..<party.count {
            ds.union(party.first!, party[i])
        }
    }
}

var roots = Set<Int>()
for person in truth {
    let root = ds.find(person)
    roots.insert(root)
}

var result = 0
outerLoop: for party in parties {
    for p in party {
        if roots.contains(ds.find(p)) { continue outerLoop }
    }
    result += 1
}

print(result)

struct DisjointSet {
    var parent: [Int]
    var rank: [Int]

    init(_ n: Int) {
        parent = Array(0...n)
        rank = [Int](repeating: 0, count: n + 1)
    }

    mutating func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }

    mutating func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)

        if rootA != rootB {
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
}
