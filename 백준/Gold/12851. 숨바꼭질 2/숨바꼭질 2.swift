let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0], k = nk[1]

var depths = Array(repeating: Int.max, count: 100001)
var paths = Array(repeating: 0, count: 100001)

if n == k {
    print(0)
    print(1)
} else {
    bfs(n, k)
    print(depths[k])
    print(paths[k])
}

func bfs(_ n: Int, _ k: Int) {
    var queue = Queue<(pos: Int, steps: Int)>()
    queue.enqueue((n, 0))
    depths[n] = 0
    paths[n] = 1

    while !queue.isEmpty {
        let (curNode, depth) = queue.dequeue()!
        let nextDepth = depth + 1

        for nextNode in [curNode - 1, curNode + 1, curNode * 2] {
            if nextNode < 0 || nextNode > 100000 { continue }
            if depths[nextNode] == Int.max {
                depths[nextNode] = nextDepth
                paths[nextNode] = paths[curNode]
                queue.enqueue((nextNode, nextDepth))
            } else if depths[nextNode] == nextDepth {
                paths[nextNode] += paths[curNode]
            }
        }
    }
}

struct Queue<T> {
    private var inStack = [T]()
    private var outStack = [T]()

    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }

    mutating func enqueue(_ element: T) {
        inStack.append(element)
    }

    mutating func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}
