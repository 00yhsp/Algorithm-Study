let nmx = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m, x) = (nmx[0], nmx[1], nmx[2])
let INF = 100001
var graph = [Int: [(Int, Int)]]()
var reverseGraph = [Int: [(Int, Int)]]()
var weights = Array(repeating: 0, count: n + 1)

for _ in 0..<m {
    let uvw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u, default: []].append((v, w))
    reverseGraph[v, default: []].append((u, w))
}

let iToX = dijkstra(reverseGraph, x)
let xToI = dijkstra(graph, x)
for i in 1...n { weights[i] += iToX[i] + xToI[i] }

print(weights.max()!)

func dijkstra(_ graph: [Int: [(Int, Int)]], _ start: Int) -> [Int] {
    var distance = Array(repeating: INF, count: n + 1)
    distance[start] = 0
    var heap = Heap<(Int, Int)> { $0.1 < $1.1 }
    heap.push((start, 0))

    while !heap.isEmpty {
        let (currentNode, currentWeight) = heap.pop()!
        if distance[currentNode] < currentWeight { continue }

        for (nextNode, nextWeight) in graph[currentNode, default: []] {
            let newDistance = currentWeight + nextWeight
            if newDistance < distance[nextNode] {
                distance[nextNode] = newDistance
                heap.push((nextNode, newDistance))
            }
        }
    }
    return distance
}

struct Heap<T> {
    var elements: [T]
    private var priority: (T, T) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(elements: [T] = [], priority: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priority = priority
        if !isEmpty { heapify() }
    }

    mutating func heapify() {
        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }

    mutating func push(_ element: T) {
        elements.append(element)
        siftUp(count - 1)
    }

    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return popped
    }

    private mutating func siftUp(_ index: Int) {
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

    private mutating func siftDown(_ index: Int) {
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
