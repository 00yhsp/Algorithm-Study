typealias Element = (node: Int, dist: Int)
let INF = 200_000_001

let ne = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, e) = (ne[0], ne[1])

var graph = [Int: [Element]]()
for _ in 0..<e {
    let uvw = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u, default: []].append((v, w))
    graph[v, default: []].append((u, w))
}
let n1n2 = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n1, n2) = (n1n2[0], n1n2[1])

let sDists = dijkstra(1)
let sToN1 = sDists[n1]
let sToN2 = sDists[n2]
let n1Dists = dijkstra(n1)
let n1ToN2 = n1Dists[n2]
let n1ToN = n1Dists[n]
let n2Dists = dijkstra(n2)
let n2ToN1 = n2Dists[n1]
let n2ToN = n2Dists[n]

let asc = [sToN1, n1ToN2, n2ToN]
let desc = [sToN2, n2ToN1, n1ToN]
let ascSum = asc.reduce(0, +)
let descSum = desc.reduce(0, +)

if ascSum < descSum {
    if asc.contains(INF) { print(-1) }
    else { print(ascSum) }
} else {
    if desc.contains(INF) { print(-1) }
    else { print(descSum) }
}

func dijkstra(_ start: Int) -> [Int] {
    var distances = [Int](repeating: INF, count: n + 1)
    distances[start] = 0
    var heap = Heap { $0.dist < $1.dist }
    heap.push((start, 0))

    while !heap.isEmpty {
        let (currentNode, currentDist) = heap.pop()!
        if distances[currentNode] < currentDist { continue }

        for (nextNode, nextDist) in graph[currentNode, default: []] {
            let candidateDist = distances[currentNode] + nextDist
            if distances[nextNode] > candidateDist {
                distances[nextNode] = candidateDist
                heap.push((nextNode, candidateDist))
            }
        }
    }

    return distances
}

struct Heap {
    var elements: [Element]
    var priority: (Element, Element) -> Bool
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(_ elements: [Element] = [], _ priority: @escaping (Element, Element) -> Bool) {
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
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}