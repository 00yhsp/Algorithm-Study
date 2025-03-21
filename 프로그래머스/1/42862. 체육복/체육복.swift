import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostSet = Set<Int>(lost)
    var reserveSet = Set<Int>(reserve)
    
    let intersection = lostSet.intersection(reserveSet)
    lostSet.subtract(intersection)
    reserveSet.subtract(intersection)
    
    var sortedReserve = Array(reserveSet).sorted()
    
    for r in sortedReserve {
        if lostSet.contains(r - 1) {
            lostSet.remove(r - 1)
        } else if lostSet.contains(r + 1) {
            lostSet.remove(r + 1)
        }
    }
    
    return n - lostSet.count
}