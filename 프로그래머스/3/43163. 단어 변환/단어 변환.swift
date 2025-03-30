import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let wordCount = words[0].count
    let count = words.count
    var graph = [Int: [Int]]()
    var result = 51
    
    if !words.contains(target) { return 0 }
    
    for i in (0..<count) { 
        if isConnected(begin, words[i], wordCount) {
            graph[i, default: []].append(-1)
            graph[-1, default: []].append(i)
        }
    }
    
    if graph[-1] == nil { return 0 }
    
    for i in (0..<count - 1) {
        for j in (i + 1..<count) {
            if isConnected(words[i], words[j], wordCount) {
                graph[i, default: []].append(j)
                graph[j, default: []].append(i)
            }            
        }
    }
    
    func bfs(_ target: Int) {
        var visited = [Bool](repeating: false, count: count)
        var queue = Queue()
        queue.enqueue((-1, 0))
        
        while !queue.isEmpty {
            let (currentNode, currentDepth) = queue.dequeue()!
            if currentNode == target {
                result = min(result, currentDepth)
            }
            for nextNode in graph[currentNode, default: []] {
                if nextNode == -1 { continue }
                if !visited[nextNode] {
                    visited[nextNode] = true
                    queue.enqueue((nextNode, currentDepth + 1))
                }
            }
        }
    }
    
    bfs(words.firstIndex { $0 == target }!)
    
    if result == 51 { return 0 }
    return result
}

func isConnected(_ a: String, _ b: String, _ n: Int) -> Bool {
    var diffCount = 0
    
    let a = Array(a)
    let b = Array(b)
    
    for i in (0..<n) {
        if a[i] != b[i] { diffCount += 1 }
        if diffCount > 1 { return false }
    }
    
    return true
}

struct Queue {
    var inStack = [(Int, Int)]()
    var outStack = [(Int, Int)]()
    
    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }
    
    mutating func enqueue(_ element: (Int, Int)) {
        inStack.append(element)
    }
    
    mutating func dequeue() -> (Int, Int)? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        } 
        return outStack.popLast()
    }
}