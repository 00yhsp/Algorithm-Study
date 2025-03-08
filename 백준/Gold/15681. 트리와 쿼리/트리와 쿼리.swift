let nrq = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, r, q) = (nrq[0], nrq[1], nrq[2])

var tree = [Int: [Int]]()
var size = [Int](repeating: 0, count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)

for _ in 1..<n {
    let uv = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v) = (uv[0], uv[1])

    tree[u, default: []].append(v)
    tree[v, default: []].append(u)
}

countSubtreeNodes(r)
var result = ""
for _ in 0..<q { result += "\(size[Int(readLine()!)!])\n" }
print(result, terminator: "")

func countSubtreeNodes(_ current: Int) {
    size[current] = 1
    visited[current] = true
    for next in tree[current, default: []] {
        if !visited[next] {
            countSubtreeNodes(next)
            size[current] += size[next]
        }
    }
}
