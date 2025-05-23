import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    for com in commands {
        var subarr = array[com[0] - 1..<com[1]].sorted()
        result.append(subarr[com[2] - 1])
    }
    return result
}