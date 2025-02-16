let tc = Int(readLine()!)!
let INF = 5000001

for _ in 0..<tc { solve() }

func solve() {
    let nmw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m, w) = (nmw[0], nmw[1], nmw[2])
    var edges = [(Int, Int, Int)]()

    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        edges.append((edge[0], edge[1], edge[2]))
        edges.append((edge[1], edge[0], edge[2]))
    }

    for _ in 0..<w {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        edges.append((edge[0], edge[1], -edge[2]))
    }

    bellmanFord(n, edges) ? print("YES") : print("NO")
}

func bellmanFord(_ n: Int, _ edges: [(Int, Int, Int)]) -> Bool {
    var distance = Array(repeating: INF, count: n + 1)
    distance[1] = 0

    for _ in 1..<n {
        for (u, v, w) in edges {
            if distance[u] + w < distance[v] {
                distance[v] = distance[u] + w
            }
        }
    }

    for (u, v, w) in edges {
        if distance[u] + w < distance[v] {
            return true
        }
    }

    return false
}
