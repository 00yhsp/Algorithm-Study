import Foundation

func solution(_ board:[String]) -> Int {
    let rows = board.count
    let cols = board[0].count
    
    var map: [[Character]] = board.map { Array($0) }

    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    var dist = Array(repeating: Array(repeating: -1, count: cols), count: rows)
    var queue = Queue()
    
    var start = (-1, -1)
    var goal = (-1, -1)
    
    for r in 0..<rows {
        for c in 0..<cols {
            if map[r][c] == "R" {
                start = (r, c)
            } else if map[r][c] == "G" {
                goal = (r, c)
            }
        }
    }
    
    queue.enqueue((start.0, start.1, 0))
    dist[start.0][start.1] = 0
    
    while !queue.isEmpty {
        let current = queue.dequeue()!
        let cR = current.0
        let cC = current.1
        let cD = current.2
        
        if cR == goal.0 && cC == goal.1 { return cD }
        
        for (dR, dC) in directions {
            var nR = cR
            var nC = cC
            
            while true {
                let nextR = nR + dR
                let nextC = nC + dC
                
                if nextR < 0 || nextR >= rows || nextC < 0 || nextC >= cols || map[nextR][nextC] == "D" {
                    break
                }
                nR = nextR
                nC = nextC
            }
            
            if dist[nR][nC] == -1 {
                dist[nR][nC] = cD + 1 
                queue.enqueue((nR, nC, cD + 1))
            }
        }
    }
    
    return -1
}

struct Queue {
    private var _inputStack = [(Int, Int, Int)]()
    private var _outputStack = [(Int, Int, Int)]()
    
    var isEmpty: Bool { 
        return _inputStack.isEmpty && _outputStack.isEmpty
    }
    
    var count: Int {
        return _inputStack.count + _outputStack.count
    }
    
    mutating func enqueue(_ element: (Int, Int, Int)) {
        _inputStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> (Int, Int, Int)? {
        if _outputStack.isEmpty {
            _outputStack = _inputStack.reversed()
            _inputStack = []
        }
        return _outputStack.popLast()
    }
}
