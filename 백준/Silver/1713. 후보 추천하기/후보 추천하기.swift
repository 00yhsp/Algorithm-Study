typealias Element = (element: Int, likes: Int, age: Int)

let limit = Int(readLine()!)!
let likeCount = Int(readLine()!)!
let likes = readLine()!.split(separator: " ").compactMap { Int($0) }
var heap = Heap() {
    if $0.likes == $1.likes { return $0.age > $1.age }
    else { return $0.likes < $1.likes }
}

for element in likes {
    if heap.contains(element) { 
        heap.like(element) 
    } else if heap.count >= limit {
        heap.pop()
        heap.push((element, 1, 0))
    } else {
        heap.push((element, 1, 0))
    }
    heap.incrementAge()
    heap.heapify()
}

print(heap.elements.map { $0.element }.sorted().map { String($0) }.joined(separator: " "), terminator: "")


struct Heap {
    var elements: [Element]
    let priority: (Element, Element) -> Bool

    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }

    init(elements: [Element] = [], priority: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priority = priority
        heapify()
    } 

    func contains(_ element: Int) -> Bool {
        return elements.contains(where: { $0.element == element })
    }
    
    mutating func heapify() {
        guard !isEmpty else { return }
        for i in stride(from: count / 2 - 1, through: 0, by: -1) { siftDown(i) }
    }
    
    mutating func push(_ element: Element) {
        elements.append(element)
        siftUp(count - 1)
    }

    mutating func incrementAge() {
        elements = elements.map { ($0.element, $0.likes, $0.age + 1) }
    }

    mutating func like(_ element: Int) {
        let idx = elements.firstIndex(where: { $0.element == element })!
        elements[idx].likes += 1
    }

    @discardableResult
    mutating func pop() -> Element? {
        guard !isEmpty else { return nil }

        elements.swapAt(0, count - 1)

        let popped = elements.removeLast()

        if !isEmpty { siftDown(0) }

        return popped
    }
    
    mutating private func siftUp(_ index: Int) {
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

    mutating private func siftDown(_ index: Int) {
        var parentIndex = index

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