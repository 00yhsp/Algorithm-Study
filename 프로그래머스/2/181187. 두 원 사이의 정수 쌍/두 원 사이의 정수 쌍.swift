import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var totalCount: Int64 = 0

    for x in 1...r2 {
        let yMax = floor(sqrt(Double(r2 * r2 - x * x)))
        var yMin: Double = 0
        if x < r1 {
            yMin = ceil(sqrt(Double(r1 * r1 - x * x)))
        } else {
            yMin = 1
        }
        
        if yMax >= yMin { totalCount += (Int64(yMax) - Int64(yMin) + 1) }
    }
    
    return totalCount * 4 + Int64(r2 - r1 + 1) * 4
}