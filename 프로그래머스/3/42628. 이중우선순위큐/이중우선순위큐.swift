import Foundation
func solution(_ operations:[String]) -> [Int] {
    func cleanHeap(_ heap: inout Heap, _ deleted: inout [Bool]) {
       while let peek = heap.peek, deleted[peek.1] == true {
            heap.pop()
        }  
    }
    var minHeap = Heap { $0.0 < $1.0 }
    var maxHeap = Heap { $0.0 > $1.0 }
    var deleted = Array(repeating: false, count: operations.count)

    for (id, op) in operations.enumerated() {
        let row = op.split(separator: " ").compactMap { String($0) }
        let optr = row[0]
        let operand = Int(row[1])!
        if optr == "I" {
            minHeap.push((operand, id))
            maxHeap.push((operand, id))
        } else if operand == 1 {
            cleanHeap(&maxHeap, &deleted)
            if let popped = maxHeap.pop() { deleted[popped.1] = true }
        } else {
            cleanHeap(&minHeap, &deleted)
            if let popped = minHeap.pop() { deleted[popped.1] = true }
        }
    }
    cleanHeap(&maxHeap, &deleted)
    cleanHeap(&minHeap, &deleted)
    
    if maxHeap.isEmpty {
        return [0, 0]
    } else {
        return [maxHeap.pop()!.0, minHeap.pop()!.0]
    }
}


struct Heap {
    var elements: [(Int, Int)]
    var priority: ((Int, Int), (Int, Int)) -> Bool
    
    var isEmpty: Bool { elements.isEmpty }
    var peek: (Int, Int)? { elements.first }
    
    init(elements: [(Int, Int)] = [], priority: @escaping ((Int, Int), (Int, Int)) -> Bool) {
        self.elements = elements
        self.priority = priority
        
        if !isEmpty { heapify() }
    }
    
    mutating func heapify() {
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }
    
    mutating func push(_ element: (Int, Int)) {
        elements.append(element)
        siftUp(elements.count - 1)
    }
    
    @discardableResult
    mutating func pop() -> (Int, Int)? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let popped = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return popped
    }
    
    mutating func siftUp(_ index: Int) {
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
    
    mutating func siftDown(_ index: Int) {
        var parentIndex = index
        let count = elements.count
        
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
