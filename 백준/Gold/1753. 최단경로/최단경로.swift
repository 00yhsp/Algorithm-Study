typealias Element = (node: Int, dist: Int)
let INF = 3_000_001

let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let (v, e) = (ve[0], ve[1])
let start = Int(readLine()!)!
var graph = [Int: [Element]]()
for _ in 0..<e {  
    let uvw = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[uvw[0], default: []].append((uvw[1], uvw[2]))
}
var heap = Heap { $0.dist < $1.dist }
heap.push((start, 0))
var distances = [Int](repeating: INF, count: v + 1)
distances[start] = 0

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

var output = [String]()
for i in 1...v {
    output.append(distances[i] == INF ? "INF" : String(distances[i]))
}
print(output.joined(separator: "\n"))

struct Heap {
    var elements: [Element]
    var priority: (Element, Element) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(elements: [Element] = [], priority: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priority = priority
        heapify()
    }

    private mutating func heapify() {
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
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !elements.isEmpty { siftDown(0) }
        return popped
    }

    private mutating func siftUp(_ x: Int) {
        var childIndex = x
        let child = elements[x]

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
            if parentIndex == candidateIndex { break }
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}