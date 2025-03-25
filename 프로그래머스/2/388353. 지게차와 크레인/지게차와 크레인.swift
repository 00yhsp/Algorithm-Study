import Foundation

func solution(_ storage:[String], _ requests:[String]) -> Int {
    let n = storage.count
    let m = storage[0].count
    var grid = Array(repeating: Array(repeating: "-1", count: m + 2), count: n + 2)
    
    for i in 0..<n {
        let row = Array(storage[i])
        for j in 0..<m {
            grid[i + 1][j + 1] = String(row[j])
        }
    }
    
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    func markOutside() -> [[Bool]] {
        var outside = Array(repeating: Array(repeating: false, count: m + 2), count: n + 2)
        var queue = Queue()
        queue.enqueue((0, 0))
        outside[0][0] = true
        
        while !queue.isEmpty {
            let (r, c) = queue.dequeue()!
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                if nr < 0 || nr >= n + 2 || nc < 0 || nc >= m + 2 { continue }
                if outside[nr][nc] { continue }
                if grid[nr][nc] == "-1" {
                    outside[nr][nc] = true
                    queue.enqueue((nr, nc))
                }
            }
        }
        return outside
    }
    
    for request in requests {
        let outside = markOutside()
        if request.count == 2 {
            let target = String(request.first!)
            for i in 1...n {
                for j in 1...m {
                    if grid[i][j] == target { grid[i][j] = "-1" }
                }
            }
        } else {
            let target = String(request.first!)
            for i in 1...n {
                for j in 1...m {
                    if grid[i][j] != target { continue }
                    for (dr, dc) in directions {
                        let nr = i + dr
                        let nc = j + dc
                        if !outside[nr][nc] { continue }
                        grid[i][j] = "-1"
                        break
                    }
                }
            }
        }
    }
    
    let answer = grid.reduce(0) { $0 + $1.filter { $0 != "-1" }.count }
    return answer
}

struct Queue {
    var inStack = [(Int, Int)]()
    var outStack = [(Int, Int)]()
    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }
    
    mutating func enqueue(_ element: (Int, Int)) {
        inStack.append(element)
    }
    
    mutating func dequeue() -> (Int, Int)? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack = []
        }
        return outStack.popLast()
    }
}