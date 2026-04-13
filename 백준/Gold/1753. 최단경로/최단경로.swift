typealias Element = (node: Int, distance: Int)

let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let (v, e) = (ve[0], ve[1])
let start = Int(readLine()!)!
let distances = dijkstra(start)
distances.forEach { print($0 == Int.max / 2 ? "INF" : "\($0)") }

func dijkstra(_ s: Int) -> [Int] {
    var distance = [Int](repeating: Int.max / 2, count: v + 1)
    var heap = Heap { $0.distance < $1.distance }
    var graph = [Int: [Element]]()
    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (u, v, w) = (input[0], input[1], input[2])
        graph[u, default: []].append((v, w))
    }
    
    distance[s] = 0
    heap.push((s, 0))

    while !heap.isEmpty {
        let (currentNode, currentDistance) = heap.pop()!
        if distance[currentNode] < currentDistance { continue }

        for (nextNode, nextDistance) in graph[currentNode, default: []] {
            let candidateDistance = currentDistance + nextDistance
            if distance[nextNode] > candidateDistance {
                distance[nextNode] = candidateDistance
                heap.push((nextNode, candidateDistance))
            }
        }
    }
    distance.removeFirst()
    return distance
}


struct Heap {
    var elements = [Element]()
    let priority: (Element, Element) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(priority: @escaping (Element, Element) -> Bool) {
        self.priority = priority
        heapify()
    }

    mutating func heapify() {
        guard !isEmpty else { return }
        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
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

    mutating func siftUp(_ x: Int) {
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

    mutating func siftDown(_ x: Int) {
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