import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    var rocks = rocks.sorted()
    rocks.append(distance)

    var start = 1; var end = 1_000_000_000
    
    while start <= end {
        let mid = (start + end) / 2

        var prev = 0
        var count = 0
        for rock in rocks {
            if rock - prev < mid {
                count += 1
            } else {
                prev = rock
            }
        }
        
        if count <= n {
            start = mid + 1            
        } else {
            end = mid - 1
        }
    }
    
    return end
}


