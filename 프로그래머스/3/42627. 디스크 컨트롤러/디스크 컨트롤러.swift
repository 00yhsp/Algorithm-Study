import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    let count = jobs.count
    var jobs = (0..<jobs.count)
                .map { (jobs[$0][0], jobs[$0][1], $0) }
                .sorted { $0.0 > $1.0 }
    var time = 0
    var totalTurnAroundTime = 0
    var heap = Heap { 
        if $0.time == $1.time {
            if $0.requestTime == $1.requestTime {
                return $0.no < $1.no
            } else {
                return $0.requestTime < $1.requestTime
            }
        } else {
            return $0.time < $1.time
        }
    }
    
    while !jobs.isEmpty || !heap.isEmpty {
        while let last = jobs.last, last.0 <= time {
            heap.push(jobs.removeLast())
        }
        if let popped = heap.pop() {
            time += popped.time
            totalTurnAroundTime += time - popped.requestTime
        } else {
            if let last = jobs.last {
                time = last.0
            }
        }
    }
    
    return totalTurnAroundTime / count
}

struct Heap {
    var elements: [(requestTime: Int, time: Int, no: Int)]
    var priority: ((requestTime: Int, time: Int, no: Int), (requestTime: Int, time: Int, no: Int)) -> Bool
    
    var isEmpty: Bool { elements.isEmpty }
    var peek: (requestTime: Int, time: Int, no: Int)? { elements.first }
    
    init(elements: [(requestTime: Int, time: Int, no: Int)] = [], priority: @escaping ((requestTime: Int, time: Int, no: Int), (requestTime: Int, time: Int, no: Int)) -> Bool) {
        self.elements = elements
        self.priority = priority
        
        if !isEmpty { heapify() }
    }
    
    mutating func heapify() {
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }
    
    mutating func push(_ element: (requestTime: Int, time: Int, no: Int)) {
        elements.append(element)
        siftUp(elements.count - 1)
    }
    
    mutating func pop() -> (requestTime: Int, time: Int, no: Int)? {
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

