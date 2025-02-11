import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
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

        for next in [curNode - 1, curNode + 1, curNode * 2] {
            if next < 0 || next > 100000 { continue }
            if depths[next] == Int.max {
                depths[next] = nextDepth
                paths[next] = paths[curNode]
                queue.enqueue((next, nextDepth))
            } else if depths[next] == nextDepth {
                paths[next] += paths[curNode]
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
