let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var graph = [Int: [Int]]()
var visited = Array(repeating: false, count: n + 1)
var count = 0

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    graph[uv[0], default: []].append(uv[1])
    graph[uv[1], default: []].append(uv[0])
}

for i in 1...n {
    if !visited[i] { count += 1; bfs(i) }
}

print(count)

func bfs(_ start: Int) {
    var stack = Stack<Int>()
    stack.push(start)

    while !stack.isEmpty {
        let current = stack.pop()!
        visited[current] = true

        for node in graph[current, default: []] {
            if !visited[node] { stack.push(node) }
        }
    }
}


struct Stack<T> {
    private var _stack = [T]()
    var isEmpty: Bool { _stack.isEmpty }
    var count: Int { _stack.count }
    mutating func push(_ element: T) { _stack.append(element) }
    mutating func pop() -> T? { _stack.popLast() }
}
