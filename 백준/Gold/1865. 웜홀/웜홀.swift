typealias Edge = (start: Int, end: Int, dist: Int)
let INF = 50_000_001

let tc = Int(readLine()!)!

for _ in 0..<tc {
    let nmw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m, w) = (nmw[0], nmw[1], nmw[2])
    
    var edges = [Edge]()
    for _ in 0..<m {
        let set = readLine()!.split(separator: " ").compactMap { Int($0) }
        let edge1 = (set[0], set[1], set[2])
        let edge2 = (set[1], set[0], set[2])
        edges.append(edge1)
        edges.append(edge2)
    }
    for _ in 0..<w {
        let set = readLine()!.split(separator: " ").compactMap { Int($0) }
        let edge = (set[0], set[1], -set[2])
        edges.append(edge)
    }

    print(bellmanFord(n, edges) ? "YES" : "NO")
}

func bellmanFord(_ n: Int, _ edges: [Edge]) -> Bool {
    var distances = [Int](repeating: INF, count: n + 1)
    distances[1] = 0

    for _ in 0..<n - 1 {
        for (u, v, w) in edges {
            if distances[u] + w < distances[v] { distances[v] = distances[u] + w }
        }
    }

    for (u, v, w) in edges {
        if distances[u] + w < distances[v] { return true }
    }
    
    return false
}