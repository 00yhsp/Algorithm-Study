import Foundation

struct Job {
    let progress: Int
    let speed: Int
}

struct Queue {
    var inStack = [Job]()
    var outStack = [Job]()
    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }
    var count: Int { inStack.count + outStack.count }
    var peek: Job? { 
        if isEmpty { return nil }
        return outStack.isEmpty ? inStack.first : outStack.last
    }
    
    init(_ elements: [Job] = []) {
        self.inStack = elements
    }
    
    mutating func enqueue(_ element: Job) {
        inStack.append(element)
    }
    
    mutating func dequeue() -> Job? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let jobs = zip(progresses, speeds).map { Job(progress: $0, speed: $1) }
    var queue = Queue(jobs)
    var days = 0
    var current = 0
    var result = [Int]()
    while !queue.isEmpty {
        let popped = queue.dequeue()!
        if (100 - popped.progress) > popped.speed * days {
            days = (100 - popped.progress + popped.speed - 1) / popped.speed
            if current != 0 { 
                result.append(current) 
                current = 0
            } 
        }
        current += 1
    }
    if current != 0 { result.append(current) }
    return result
}