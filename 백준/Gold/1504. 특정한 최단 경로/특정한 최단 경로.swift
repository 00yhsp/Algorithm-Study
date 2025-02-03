let ne = readLine()!.split(separator: " ").map { Int($0)! }
let n = ne[0], e = ne[1]
let INF = Int.max / 2

var graph = Array(repeating: [(Int, Int)](), count: n + 1)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, w) = (input[0], input[1], input[2])
    graph[u].append((v, w))
    graph[v].append((u, w))
}

let n1n2 = readLine()!.split(separator: " ").map { Int($0)! }
let n1 = n1n2[0], n2 = n1n2[1]

let d1 = safeAdd(dijkstra(1, n1), dijkstra(n1, n2), dijkstra(n2, n))
let d2 = safeAdd(dijkstra(1, n2), dijkstra(n2, n1), dijkstra(n1, n))

if d1 != -1 && d2 != -1 {
    print(min(d1, d2))
} else {
    print(max(d1, d2))
}

func dijkstra(_ start: Int, _ end: Int) -> Int {
    var distance = Array(repeating: INF, count: n + 1)
    distance[start] = 0
    var heap = Heap<(weight: Int, node: Int)>(priority: <)
    heap.push((0, start))

    while !heap.isEmpty {
        let (currentWeight, currentNode) = heap.pop()!
        if distance[currentNode] < currentWeight { continue }

        for (nextNode, nextWeight) in graph[currentNode] {
            if currentWeight > Int.max - nextWeight { continue }
            let newDistance = currentWeight + nextWeight
            if newDistance < distance[nextNode] {
                distance[nextNode] = newDistance
                heap.push((newDistance, nextNode))
            }
        }
    }
    return distance[end]
}

func safeAdd(_ n1: Int, _ n2: Int, _ n3: Int) -> Int {
    if n1 == INF || n2 == INF || n3 == INF { return -1 }
    else { return n1 + n2 + n3 }
}

struct Heap<T> {
    private var elements: [T]
    private var priority: (T, T) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    var peek: T? { elements.first }

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
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
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
            if parentIndex == candidateIndex { break }
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
