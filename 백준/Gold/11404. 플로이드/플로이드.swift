let INF = 10_000_000_001

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)
for i in 1...n { graph[i][i] = 0 }
for _ in 0..<m {
    let uvw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u][v] = min(graph[u][v], w)
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

for i in 1...n {
    var output = [String]()
    for j in 1...n { 
        let weight = graph[i][j] == INF ? 0 : graph[i][j]
        output.append(String(weight)) 
    }
    print(output.joined(separator: " "))
}