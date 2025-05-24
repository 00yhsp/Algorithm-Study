let ve = readLine()!.split(separator: " ").map { Int($0)! }
let v = ve[0], e = ve[1]
let INF = 200001
var graph = [Int: [(Int, Int)]]()

let s = Int(readLine()!)!

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, w) = (input[0], input[1], input[2])
    graph[u, default: []].append((v, w))
}

let weights = dijkstra(s, v)
print(weights)

func dijkstra(_ start: Int, _ end: Int) -> String {
    var distance = Array(repeating: INF, count: v + 1)
    distance[start] = 0
    var heap = Heap<(Int, Int)> { $0.1 < $1.1 }
    heap.push((start, 0))
    while !heap.isEmpty {
        let (currentNode, currentWeight) = heap.pop()!
        if distance[currentNode] < currentWeight { continue }

        for (nextNode, nextWeight) in graph[currentNode, default: []] {
            if currentWeight > Int.max - nextWeight { continue }
            let newDistance = currentWeight + nextWeight
            if distance[nextNode] > newDistance {
                distance[nextNode] = newDistance
                heap.push((nextNode, newDistance))
            }
        }
    }
    return Array(distance.dropFirst()).map { $0 == INF ? "INF" : String($0) }.joined(separator: "\n")
}

struct Heap<T> {
    private var elements: [T]
    private var priority: (T, T) -> Bool

    var isEmpty: Bool { elements.isEmpty }

    init(elements: [T] = [], priority: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priority = priority
        if !elements.isEmpty { heapify() }
    }

    mutating func heapify() {
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }
    mutating func push(_ element: T) {
        elements.append(element)
        siftUp(elements.count - 1)
    }
    mutating func pop() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let popped = elements.removeLast()
        if !elements.isEmpty { siftDown(0) }
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
        let count = elements.count

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
            if parentIndex == candidateIndex { break }
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
