let t = Int(readLine()!)!

let operations = [(d, 1), (s, 2), (l, 3), (r, 4)]

var visited = Array(repeating: false, count: 10000)

for _ in 0..<t {
    visited = Array(repeating: false, count: 10000)
    solution()
}

func solution() {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0], b = ab[1]
    print(bfs(a, b))
}

func bfs(_ start: Int, _ end: Int) -> String {
    var queue = Queue<Int>()
    queue.enqueue((start, 0))
    visited[start] = true

    while !queue.isEmpty {
        let (node, path) = queue.dequeue()!
        if node == end { return itoa(path) }
        for (op, idx) in operations {
            let next = op(node)
            if !visited[next] {
                visited[next] = true
                queue.enqueue((next, path * 10 + idx))
            }
        }
    }

    return ""
}

func itoa(_ n: Int) -> String {
    var str = ""
    for i in String(n) {
        switch operations[Int(String(i))! - 1].1 {
        case 1: str += "D"
        case 2: str += "S"
        case 3: str += "L"
        case 4: str += "R"
        default: break
        }
    }
    return str
}

func d(_ n: Int) -> Int { (2 * n) % 10000 }
func s(_ n: Int) -> Int { return n == 0 ? 9999 : n - 1 }
func l(_ n: Int) -> Int { return (n % 1000) * 10 + n / 1000 }
func r(_ n: Int) -> Int { return (n % 10) * 1000 + n / 10 }

struct Queue<T> {
    typealias Element = (value: T, path: Int)
    private var queue = [Element]()
    private var front = 0
    var isEmpty: Bool { front >= queue.count }
    mutating func enqueue(_ element: Element) { queue.append(element) }
    mutating func dequeue() -> Element? {
        let value = queue[front]
        front += 1
        return value
    }
}
