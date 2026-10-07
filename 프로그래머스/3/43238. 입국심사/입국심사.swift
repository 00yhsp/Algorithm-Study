import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var start = 1
    var end = 1_000_000_000_000_000_000
    
    while start <= end {
        let mid = (start + end) / 2
        var count = 0
        for time in times {
            count += mid / time
        }
        if count >= n {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return Int64(start)
}