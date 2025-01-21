let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0], k = nk[1]
print(dijkstra(n, k))

func dijkstra(_ start: Int, _ end: Int) -> Int {
    var distance = Array(repeating: 100001, count: 100001)
    var heap = Heap<(node: Int, depth: Int)> { $0.depth < $1.depth }

    distance[start] = 0
    heap.push((start, 0))

    while !heap.isEmpty {
        let (currentNode, currentDepth) = heap.pop()!
        if currentNode == end { return currentDepth }
        if currentDepth > distance[currentNode] { continue }

        let nextNodes = [
            (node: currentNode * 2, depth: currentDepth),
            (node: currentNode + 1, depth: currentDepth + 1),
            (node: currentNode - 1, depth: currentDepth + 1)
        ]

        for next in nextNodes {
            if next.node >= 0 && next.node <= 100000 && distance[next.node] > next.depth {
                distance[next.node] = next.depth
                heap.push((next.node, next.depth))
            }
        }
    }

    return distance[end]
}

struct Heap<T> {
    var elements: [T]
    var priority: (T, T) -> Bool

    var isEmpty: Bool { elements.isEmpty }

    init(elements: [T] = [], priority: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priority = priority

        if !elements.isEmpty { heapify() }
    }

    mutating func heapify() {
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) { siftDown(i) }
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
