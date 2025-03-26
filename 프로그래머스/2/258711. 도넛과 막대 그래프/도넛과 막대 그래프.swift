import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var inputEdges = [Int: Int]()
    var outputEdges = [Int: Int]()
    var keys = Set<Int>()
    var result = [0, 0, 0, 0]
    for edge in edges {
        let output = edge[0], input = edge[1]
        keys.insert(output); keys.insert(input)
        outputEdges[output, default: 0] += 1
        inputEdges[input, default: 0] += 1
    }
    
    for key in keys {
        if inputEdges[key, default: 0] == 0 && outputEdges[key, default: 0] >= 2 {
            result[0] = key
        }
        if inputEdges[key, default: 0] <= 2 && outputEdges[key, default: 0] == 0 {
            result[2] += 1
        }
        if inputEdges[key, default: 0] >= 2 && outputEdges[key, default: 0] == 2 {
            result[3] += 1
        }
        
        result[1] = outputEdges[result[0], default: 0] - (result[2] + result[3])
    }
    
    return result
}