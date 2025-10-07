import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let n = queue1.count
    let arr = queue1 + queue2
    
    var sum1 = queue1.reduce(0, +)
    let sum2 = queue2.reduce(0, +)
    let total = sum1 + sum2
    
    if total % 2 != 0 { return -1 }
    let target = total / 2
    
    if let maxX = arr.max(), maxX > target { return -1 }
    
    var i = 0
    var j = n
    var moves = 0
    let limit = 4 * n

    while moves <= limit {
        if sum1 == target { return moves }
        if sum1 < target {
            if j >= 2 * n { return -1 }
            sum1 += arr[j]
            j += 1
        } else {
            if i >= 2 * n { return -1 }
            sum1 -= arr[i]
            i += 1
        }
        moves += 1
    }
    return -1
}