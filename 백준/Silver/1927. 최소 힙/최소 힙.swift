let N = Int(readLine()!)!
var heap = Heap<Int>(priority: <)
var output = ""
for _ in 0..<N {
    let n = Int(readLine()!)!
    if n == 0 {
        if let popped = heap.pop() { output += "\(popped)\n" }
        else { output += "0\n" }
    } else {
        heap.push(n)
    }
}
print(output, terminator: "")

struct Heap<T> {
    var elements: [T]
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

            if leftIndex < count && priority(elements[leftIndex], elements[candidateIndex]) { candidateIndex = leftIndex }
            if rightIndex < count && priority(elements[rightIndex], elements[candidateIndex]) { candidateIndex = rightIndex }
            if candidateIndex == parentIndex { break }

            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
