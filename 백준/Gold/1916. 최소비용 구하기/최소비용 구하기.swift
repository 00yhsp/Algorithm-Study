let n = Int(readLine()!)!
let m = Int(readLine()!)!

let INF = 1_000_000_001
var graph = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

for _ in 0..<m {
    let sew = readLine()!.split(separator: " ").map { Int($0)! }
    let start = sew[0], end = sew[1], weight = sew[2]
    graph[start][end] = min(graph[start][end], weight)
}

let se = readLine()!.split(separator: " ").map { Int($0)! }
let start = se[0], end = se[1]

print(dijkstra(start, end))

func dijkstra(_ start: Int, _ end: Int) -> Int {
    var distance = Array(repeating: INF, count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    distance[start] = 0

    for i in 1...n { graph[i][i] = 0 }
    for _ in 1...n {
        var minDistance = INF
        var currentNode = -1

        for i in 1...n {
            if !visited[i] && distance[i] < minDistance {
                minDistance = distance[i]
                currentNode = i
            }
        }

        if currentNode == -1 { break }

        visited[currentNode] = true

        for nextNode in 1...n {
            if visited[nextNode] { continue }
            let newDistance = distance[currentNode] + graph[currentNode][nextNode]
            if newDistance < distance[nextNode] { distance[nextNode] = newDistance }
        }

    }

    return distance[end]
}
