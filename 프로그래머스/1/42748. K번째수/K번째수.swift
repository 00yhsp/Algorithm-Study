import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    
    for com in commands {
        let partial = array[com[0] - 1...com[1] - 1].sorted()
        result.append(partial[com[2] - 1])    
    }
    
    return result
}