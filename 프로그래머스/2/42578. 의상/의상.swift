import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict = [String: [String]]()
    var result = 1
    for cloth in clothes {
        dict[cloth[1], default: []].append(cloth[0])
    }
    dict.forEach { result *= $0.1.count + 1 }
    return result - 1
}