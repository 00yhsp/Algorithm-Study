// import Foundation

// func solution(_ jobs:[[Int]]) -> Int {
//     let count = jobs.count
//     var jobs = (0..<jobs.count)
//                 .map { (jobs[$0][0], jobs[$0][1], $0) }
//                 .sorted { $0.0 > $1.0 }
//     var time = 0
//     var totalTurnAroundTime = 0
//     var heap = Heap { 
//         if $0.time == $1.time {
//             if $0.requestTime == $1.requestTime {
//                 return $0.no < $1.no
//             } else {
//                 return $0.requestTime < $1.requestTime
//             }
//         } else {
//             return $0.time < $1.time
//         }
//     }
    
//     while !jobs.isEmpty || !heap.isEmpty {
//         while let last = jobs.last, last.0 <= time {
//             heap.push(jobs.removeLast())
//         }
//         if !heap.isEmpty {
//             let popped = heap.pop()!
//             time += popped.time
//             totalTurnAroundTime += time - popped.requestTime
//         } else {
//             time += 1        
//         }
//     }
    
//     return totalTurnAroundTime / count
// }

// struct Heap {
//     var elements: [(requestTime: Int, time: Int, no: Int)]
//     var priority: ((requestTime: Int, time: Int, no: Int), (requestTime: Int, time: Int, no: Int)) -> Bool
    
//     var isEmpty: Bool { elements.isEmpty }
//     var peek: (requestTime: Int, time: Int, no: Int)? { elements.first }
    
//     init(elements: [(requestTime: Int, time: Int, no: Int)] = [], priority: @escaping ((requestTime: Int, time: Int, no: Int), (requestTime: Int, time: Int, no: Int)) -> Bool) {
//         self.elements = elements
//         self.priority = priority
        
//         if !isEmpty { heapify() }
//     }
    
//     mutating func heapify() {
//         for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
//             siftDown(i)
//         }
//     }
    
//     mutating func push(_ element: (requestTime: Int, time: Int, no: Int)) {
//         elements.append(element)
//         siftUp(elements.count - 1)
//     }
    
//     mutating func pop() -> (requestTime: Int, time: Int, no: Int)? {
//         guard !isEmpty else { return nil }
//         elements.swapAt(0, elements.count - 1)
//         let popped = elements.removeLast()
//         if !isEmpty { siftDown(0) }
//         return popped
//     }
    
//     mutating func siftUp(_ index: Int) {
//         var childIndex = index
//         let child = elements[childIndex]
        
//         while childIndex > 0 {
//             let parentIndex = (childIndex - 1) / 2
//             let parent = elements[parentIndex]
            
//             if priority(parent, child) { break }
            
//             elements[childIndex] = parent
//             childIndex = parentIndex
//         }
//         elements[childIndex] = child
//     }
    
//     mutating func siftDown(_ index: Int) {
//         var parentIndex = index
//         let count = elements.count
        
//         while true {
//             let leftIndex = parentIndex * 2 + 1
//             let rightIndex = parentIndex * 2 + 2
//             var candidateIndex = parentIndex
            
//             if leftIndex < count, priority(elements[leftIndex], elements[candidateIndex]) {
//                 candidateIndex = leftIndex
//             }
//             if rightIndex < count, priority(elements[rightIndex], elements[candidateIndex]) {
//                 candidateIndex = rightIndex
//             }
//             if parentIndex == candidateIndex { break }
//             elements.swapAt(parentIndex, candidateIndex)
//         }
//     }
// }
import Foundation

func solution(_ jobs: [[Int]]) -> Int {
    var jobs = jobs.sorted { $0[0] < $1[0] } // 요청 시점 오름차순 정렬
    var time = 0 // 현재 시간
    var totalTurnAroundTime = 0 // 총 반환 시간
    var index = 0 // 처리할 작업 인덱스
    var heap = Heap<(requestTime: Int, time: Int)> { $0.time < $1.time } // 소요 시간 기준 최소 힙
    
    while index < jobs.count || !heap.isEmpty {
        // 현재 시간까지 요청된 작업을 힙에 삽입
        while index < jobs.count && jobs[index][0] <= time {
            heap.push((requestTime: jobs[index][0], time: jobs[index][1]))
            index += 1
        }
        
        if let job = heap.pop() {
            // 힙에서 작업 꺼내 처리
            time += job.time
            totalTurnAroundTime += time - job.requestTime
        } else {
            // 힙이 비었으면 다음 작업의 요청 시점으로 이동
            if index < jobs.count {
                time = jobs[index][0]
            }
        }
    }
    
    return totalTurnAroundTime / jobs.count
}

// 최소 힙 구현 (간소화)
struct Heap<T> {
    private var elements: [T] = []
    private let priority: (T, T) -> Bool
    
    init(priority: @escaping (T, T) -> Bool) {
        self.priority = priority
    }
    
    var isEmpty: Bool { elements.isEmpty }
    
    mutating func push(_ element: T) {
        elements.append(element)
        siftUp(elements.count - 1)
    }
    
    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let result = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return result
    }
    
    private mutating func siftUp(_ index: Int) {
        var child = index
        while child > 0 {
            let parent = (child - 1) / 2
            if !priority(elements[child], elements[parent]) { break }
            elements.swapAt(child, parent)
            child = parent
        }
    }
    
    private mutating func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            
            if left < elements.count && priority(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && priority(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { break }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}