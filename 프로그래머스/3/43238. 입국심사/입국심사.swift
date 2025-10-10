import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int {
    var start = 1
    var end = times.max()! * n
    
    while start < end {
        let mid = (start + end) / 2
        print("before \(start) \(mid) \(end)")
        var served = 0
        for time in times {
            served += mid / time
            if served > n { break }
        }
        
        if served < n { start = mid + 1 }
        else { end = mid }
    }
    
    return start
}

