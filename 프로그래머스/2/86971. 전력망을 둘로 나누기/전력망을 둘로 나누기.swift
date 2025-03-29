import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph = [Int: [Int]]()
    var result = Int.max
    
    for wire in wires {
        graph[wire[0], default: []].append(wire[1])
        graph[wire[1], default: []].append(wire[0])
    }
    
    for wire in wires {
        result = min(result, getNodesCountDiff(graph, wire[0], wire[1], n))   
    }
        
    return result
}

func getNodesCountDiff(_ graph: [Int: [Int]], _ a: Int, _ b: Int, _ n: Int) -> Int {
    var graph = graph
    graph[a]!.removeAll { $0 == b }
    graph[b]!.removeAll { $0 == a }
    
    let aCount = bfs(graph, a, n)
    let bCount = bfs(graph, b, n)
    
    return abs(aCount - bCount)
}

func bfs(_ graph: [Int: [Int]], _ root: Int, _ n: Int) -> Int {
    var visited = [Bool](repeating: false, count: n + 1)
    var queue = Queue()
    var result = 0
    queue.enqueue(root)
    visited[root] = true
    
    while !queue.isEmpty {
        let currentNode = queue.dequeue()!
        result += 1
        for nextNode in graph[currentNode, default: []] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.enqueue(nextNode)
            }
        }
    }
    
    return result
}

struct Queue {
    var inStack = [Int]()
    var outStack = [Int]()
    
    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }
    
    mutating func enqueue(_ element: Int) {
        inStack.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}