import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var result = 1
    var dict = [String: Int]()
    
    for cloth in clothes {
        dict[cloth[1], default: 0] += 1
    }
    
    for k in dict.keys {
        result *= (dict[k, default: 0] + 1)
    }
    return result - 1
}