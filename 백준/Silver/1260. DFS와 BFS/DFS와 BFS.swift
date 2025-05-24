let nmv = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m, v) = (nmv[0], nmv[1], nmv[2])

var graph = [Int: [Int]]()

for _ in 0..<m {
    let se = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (s, e) = (se[0], se[1])
    graph[s, default: []].append(e)
    graph[e, default: []].append(s)
}

let keys = graph.keys
for key in keys { graph[key, default: []].sort() }

dfs()
bfs()

func bfs() {
    var queue = Queue()
    var visited = [Bool](repeating: false, count: n + 1)
    var route = [Int]()

    queue.enqueue(v)
    visited[v] = true
    
    while !queue.isEmpty {
        let current = queue.dequeue()!
        route.append(current)

        for next in graph[current, default: []] {
            if visited[next] { continue }
            queue.enqueue(next)
            visited[next] = true
        }
    }   

    for i in 0..<route.count - 1 { print(route[i], terminator: " ") }
    print(route.last!)
}

func dfs() {
    var visited = [Bool](repeating: false, count: n + 1)
    var route = [Int]()

    recursive(v)

    for i in 0..<route.count - 1 { print(route[i], terminator: " ") }
    print(route.last!)

    func recursive(_ x: Int) {
        route.append(x)
        visited[x] = true

        for next in graph[x, default: []] {
            if visited[next] { continue }
            visited[next] = true
            recursive(next)
        }
    }
}

struct Queue {
    var inStack = [Int]()
    var outStack = [Int]()

    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }

    mutating func enqueue(_ element: Int) {
        inStack.append(element)
    }

    @discardableResult
    mutating func dequeue() -> Int? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}