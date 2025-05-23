import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    let count = jobs.count
    var returnTimes = [Int]()
    var currentTime = 0
    var heap = Heap((0..<count).map { (jobs[$0][0], jobs[$0][1], $0) } ) {
        if $0.1 == $1.1 { 
            if $0.0 == $1.0 { return $0.2 < $1.2 }
            else { return $0.0 < $1.0 }
        }
        else { return $0.1 < $1.1 }
    }
    while !heap.isEmpty {
        var temp = [(Int, Int, Int)]()
        var flag = false
        
        while !heap.isEmpty {
            let popped = heap.pop()!
            if popped.0 <= currentTime {
                currentTime += popped.1
                returnTimes.append(currentTime - popped.0)
                flag = true
                break
            } else {
                temp.append(popped)
            }
        }
        if !flag, let min = temp.min(by: { $0.0 < $1.0 }) { 
            currentTime = min.0 + min.1
            returnTimes.append(min.1)
            if let firstIdx = temp.firstIndex { elem in
                elem.0 == min.0 && elem.1 == min.1 && elem.2 == min.2 
            } {
              temp.remove(at: firstIdx)    
            }
        }
        for t in temp { heap.push(t) }
    }
    
    return returnTimes.reduce(0, +) / returnTimes.count
}

struct Heap {
    var elements: [(Int, Int, Int)]
    let priority: ((Int, Int, Int), (Int, Int, Int)) -> Bool
    
    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }
    
    init(_ elements: [(Int, Int, Int)], priority: @escaping ((Int, Int, Int), (Int, Int, Int)) -> Bool) {
        self.elements = elements
        self.priority = priority
        heapify()
    }
    
    mutating func heapify() {
        guard !isEmpty else { return }
        for i in stride(from: count / 2 - 1, through: 0, by: -1) { siftDown(i) }
    }
    
    mutating func push(_ element: (Int, Int, Int)) {
        elements.append(element)
        siftUp(count - 1)
    }
    
    @discardableResult
    mutating func pop() -> (Int, Int, Int)? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return popped
    }
    
    mutating func siftUp(_ idx: Int) {
        var childIndex = idx
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
    
    mutating func siftDown(_ idx: Int) {
        var parentIndex = idx
        
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
            elements.swapAt(candidateIndex, parentIndex)
            parentIndex = candidateIndex
        }
    }
}