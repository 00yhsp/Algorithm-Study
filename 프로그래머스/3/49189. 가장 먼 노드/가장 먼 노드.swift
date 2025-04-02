import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [Int: [Int]]()
    for e in edge {
        graph[e[0], default: []].append(e[1])
        graph[e[1], default: []].append(e[0])
    }
    var queue = Queue()
    queue.push((1, 0))
    var visited = [Bool](repeating: false, count: n + 1)
    visited[1] = true
    var distance = [Int](repeating: -1, count: n + 1)
    distance[1] = 0
    
    while !queue.isEmpty {
        let (curNode, curDist) = queue.pop()!
        distance[curNode] = curDist
        
        for nextNode in graph[curNode, default: []] {
            if visited[nextNode] { continue }
            visited[nextNode] = true
            queue.push((nextNode, curDist + 1))
        }
    }
    let m = distance.max()!
    let result = distance.filter { $0 == m }.count
    
    return result
}

struct Queue {
    var inStack = [(Int, Int)]()
    var outStack = [(Int, Int)]()
    
    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }
    
    mutating func push(_ element: (Int, Int)) {
        inStack.append(element)
    }
    
    mutating func pop() -> (Int, Int)? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}