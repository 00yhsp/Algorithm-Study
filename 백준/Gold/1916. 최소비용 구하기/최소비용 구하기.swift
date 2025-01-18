let n = Int(readLine()!)!
let m = Int(readLine()!)!

let INF = 1_000_000_001
var graph = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

for _ in 0..<m {
    let sew = readLine()!.split(separator: " ").map { Int($0)! }
    let start = sew[0], end = sew[1], weight = sew[2]
    graph[start][end] = min(graph[start][end], weight)
}

let se = readLine()!.split(separator: " ").map { Int($0)! }
let start = se[0], end = se[1]

print(dijkstra(start, end))

func dijkstra(_ start: Int, _ end: Int) -> Int {
    var distance = Array(repeating: INF, count: n + 1)
    var heap = Heap<(weight: Int, node: Int)>(priority: { $0.weight < $1.weight })

    distance[start] = 0
    heap.push((weight: 0, node: start))

    while !heap.isEmpty {
        let (currentWeight, currentNode) = heap.pop()!

        if currentWeight > distance[currentNode] { continue }

        for nextNode in 1...n {
            let newDistance = currentWeight + graph[currentNode][nextNode]
            if newDistance < distance[nextNode] {
                distance[nextNode] = newDistance
                heap.push((weight: newDistance, node: nextNode))
            }
        }
    }

    return distance[end]
}

struct Heap<T> {
    private var elements: [T]
    private let priority: (T, T) -> Bool

    var isEmpty: Bool { elements.isEmpty }

    var count: Int { elements.count }

    var peek: T? { elements.first }

    init(elements: [T] = [], priority: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priority = priority

        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(i)
            }
        }
    }

    mutating func push(_ element: T) {
        elements.append(element)
        siftUp(elements.count - 1)
    }

    @discardableResult
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

            if leftIndex < count && priority(elements[leftIndex], elements[candidateIndex]) {
                candidateIndex = leftIndex
            }
            if rightIndex < count && priority(elements[rightIndex], elements[candidateIndex]) {
                candidateIndex = rightIndex
            }
            if candidateIndex == parentIndex { break }

            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
