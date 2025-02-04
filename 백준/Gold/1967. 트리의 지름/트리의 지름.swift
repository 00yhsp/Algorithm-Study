let n = Int(readLine()!)!
var graph = [Int: [(Int, Int)]]()
var visited = Array(repeating: false, count: n + 1)
var farthestNode = 0
var distance = 0

for _ in 0..<(n - 1) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, w) = (input[0], input[1], input[2])
    graph[u, default: []].append((v, w))
    graph[v, default: []].append((u, w))
}

// 루트 노드에서 가장 먼 노드 탐색
dfs(1, 0)

// visited, 탐색 결과 초기화
visited = Array(repeating: false, count: n + 1)
distance = 0

// 가장 먼 노드 탐색
dfs(farthestNode, 0)
print(distance)

func dfs(_ node: Int, _ weight: Int) {
    visited[node] = true

    if distance < weight {
        distance = weight
        farthestNode = node
    }

    for (nextNode, nextWeight) in graph[node, default: []] {
        if visited[nextNode] { continue }
        dfs(nextNode, weight + nextWeight)
    }
}
