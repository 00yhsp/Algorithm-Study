let n = Int(readLine()!)!
let m = Int(readLine()!)!

let INF = 100000001
var graph = [Int: [(Int, Int)]]()

for _ in 0..<m {
    let uvw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u, default: []].append((v, w))
}

let se = readLine()!.split(separator: " ").compactMap { Int($0) }
let (s, e) = (se[0], se[1])

let (parent, distance) = dijkstra(s)
let (count, route) = traceBack(e, parent)
print(distance)
print(count)
print(route)

func dijkstra(_ start: Int) -> ([Int], Int) {
    var distance = Array(repeating: INF, count: n + 1)
    distance[start] = 0

    var parent = Array(repeating: -1, count: n + 1)

    var heap = Heap { $0.1 < $1.1 }
    heap.push((start, 0))
    
    while !heap.isEmpty {
        let (currentNode, currentWeight) = heap.pop()!
        if distance[currentNode] < currentWeight { continue }
        for (nextNode, nextWeight) in graph[currentNode, default: []] {
            let nextDistance = currentWeight + nextWeight
            if distance[nextNode] > nextDistance {
                distance[nextNode] = nextDistance
                parent[nextNode] = currentNode
                heap.push((nextNode, nextDistance))
            }
        }
    }

    return (parent, distance[e])
}

func traceBack(_ end: Int, _ parent: [Int]) -> (Int, String) {
    var path = [Int]()
    var currentNode = end

    while currentNode != -1 {
        path.append(currentNode)
        currentNode = parent[currentNode]
    }

    return (path.count, path.reversed().map { String($0) }.joined(separator: " "))
}

struct Heap {
    var elements: [(Int, Int)]
    var priority: ((Int, Int), (Int, Int)) -> Bool

    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }

    init(elements: [(Int, Int)] = [], priority: @escaping ((Int, Int), (Int, Int)) -> Bool) {
        self.elements = elements
        self.priority = priority

        if !elements.isEmpty { heapify() }
    }

    mutating func heapify() {
        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }

    mutating func push(_ element: (Int, Int)) {
        elements.append(element)
        siftUp(count - 1)
    }

    mutating func pop() -> (Int, Int)? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return popped
    }

    mutating func siftUp(_ index: Int) {
        var childIndex = index
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

    mutating func siftDown(_ index: Int) {
        var parentIndex = index

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
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
