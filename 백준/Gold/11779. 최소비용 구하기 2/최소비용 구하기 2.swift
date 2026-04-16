typealias Element = (node: Int, dist: Int)
let INF = 10_000_000_001

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [Int: [Element]]()
for _ in 0..<m {
    let uvw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u, default: []].append((v, w))
}

let se = readLine()!.split(separator: " ").compactMap { Int($0) }
let (s, e) = (se[0], se[1])
let (distances, parent) = dijkstra()
let route = traceBack()

print(distances[e])
print(route.count)
print(route.joined(separator: " "))

func dijkstra() -> (distances: [Int], parent: [Int]) {
    var distances = [Int](repeating: INF, count: n + 1)
    var parent = [Int](repeating: INF, count: n + 1)
    var heap = Heap { $0.dist < $1.dist }

    distances[s] = 0
    heap.push((s, 0))
    
    while !heap.isEmpty {
        let (currentNode, currentDist) = heap.pop()!
        if distances[currentNode] < currentDist { continue }

        for (nextNode, nextDist) in graph[currentNode, default: []] {
            let candidateDist = distances[currentNode] + nextDist
            if distances[nextNode] > candidateDist {
                distances[nextNode] = candidateDist
                heap.push((nextNode, candidateDist))
                parent[nextNode] = currentNode
            }
        }
    }

    return (distances, parent)
}

func traceBack() -> [String] {
    var currentNode = e
    var route = [Int]()

    while currentNode != INF {
        route.append(currentNode)
        currentNode = parent[currentNode]
    }

    return route.reversed().map(String.init)
}

struct Heap {
    var elements: [Element]
    let priority: (Element, Element) -> Bool
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(_ elements: [Element] = [], priority: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priority = priority
        heapify()
    }

    mutating func push(_ element: Element) {
        elements.append(element)
        siftUp(count - 1)
    }

    mutating func pop() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return popped
    }

    private mutating func heapify() {
        guard !isEmpty else { return }
        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }

    private mutating func siftUp(_ x: Int) {
        var childIndex = x
        let child = elements[childIndex]

        while childIndex > 0 {
            let parentIndex = (childIndex - 1) / 2
            let parent = elements[parentIndex]

            if priority(parent, child) { break }

            elements[childIndex] = parent
            childIndex = parentIndex
        }
        elements[childIndex] = child
    }

    private mutating func siftDown(_ x: Int) {
        var parentIndex = x

        while true {
            let leftIndex = parentIndex * 2 + 1
            let rightIndex = parentIndex * 2 + 2
            var candidateIndex = parentIndex

            if leftIndex < count, priority(elements[leftIndex], elements[candidateIndex]) {
                candidateIndex = leftIndex
            }
            if rightIndex < count, priority(elements[rightIndex], elements[candidateIndex]) {
                candidateIndex = rightIndex
            }
            if candidateIndex == parentIndex { break }
            elements.swapAt(candidateIndex, parentIndex)
            parentIndex = candidateIndex
        }
        
    }
}
