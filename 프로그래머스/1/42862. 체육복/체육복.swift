import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let common = Set(lost).intersection(Set(reserve))
    var lost = Set(lost).subtracting(common)
    var reserve = Set(reserve).subtracting(common)

    for i in 1...n {
        guard lost.contains(i) else { continue }

        if reserve.contains(i - 1) {
            reserve.remove(i - 1)
            lost.remove(i)
        } else if reserve.contains(i + 1) {
            reserve.remove(i + 1)
            lost.remove(i)
        }
    }

    return n - lost.count
}