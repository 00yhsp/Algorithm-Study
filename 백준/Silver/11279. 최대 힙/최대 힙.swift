let n = Int(readLine()!)!
var heap = Heap<Int>(priority: >)
var output = ""

for _ in 0..<n {
    let num = Int(readLine()!)!

    if num == 0 {
        if let popped = heap.pop() { output += "\(popped)\n" }
        else { output += "0\n" }
    } else {
        heap.push(num)
    }
}

print(output)

struct Heap<T> {
    private var elements: [T]
    private var priority: (T, T) -> Bool

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

    @discardableResult mutating func pop() -> T? {
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
            if candidateIndex == parentIndex { return }

            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
