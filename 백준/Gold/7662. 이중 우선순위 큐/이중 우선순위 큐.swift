let t = Int(readLine()!)!

for _ in 0..<t { solution() }

func solution() {
    let k = Int(readLine()!)!
    var minHeap = Heap<(Int, Int)>() { $0.0 < $1.0 }
    var maxHeap = Heap<(Int, Int)>() { $0.0 > $1.0 }
    var deleted = Array(repeating: false, count: k)

    for i in 0..<k {
        let input = readLine()!.split(separator: " ")
        let op = input[0]
        let n = Int(input[1])!

        if op == "I" {
            minHeap.push((n, i))
            maxHeap.push((n, i))
        }
        else if n == 1 {
            cleanHeap(&maxHeap, deleted: &deleted)
            if let max = maxHeap.pop() { deleted[max.1] = true }
        }
        else {
            cleanHeap(&minHeap, deleted: &deleted)
            if let min = minHeap.pop() { deleted[min.1] = true }
        }
    }
    cleanHeap(&minHeap, deleted: &deleted)
    cleanHeap(&maxHeap, deleted: &deleted)

    if minHeap.isEmpty { print("EMPTY") }
    else { print(maxHeap.peek!.0, minHeap.peek!.0) }
}

func cleanHeap(_ heap: inout Heap<(Int, Int)>, deleted: inout [Bool]) {
    while let top = heap.peek, deleted[top.1] { heap.pop() }
}

struct Heap<T> {
    private var elements: [T]
    private var priority: (T, T) -> Bool
    var isEmpty: Bool { elements.isEmpty }
    var peek: T? { elements.first }
    var count: Int { elements.count }

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
