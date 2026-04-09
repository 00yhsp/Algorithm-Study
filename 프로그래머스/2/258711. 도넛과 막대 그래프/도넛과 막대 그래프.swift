import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var input = [Int: Int]()
    var output = [Int: Int]()
    var nodes = Set<Int>()
    var result = [Int](repeating: 0, count: 4)
    
    for edge in edges {
        input[edge[1], default: 0] += 1
        output[edge[0], default: 0] += 1
        nodes.insert(edge[0])
        nodes.insert(edge[1])
    }
    
    for node in nodes {
        // 생성
        if output[node, default: 0] >= 2 && input[node, default: 0] == 0 {
            result[0] = node
        }
        
        // 도넛
        // 무조건 input 1 output 1이므로 연결되면 input 2 output 1
        // 생성 output - (막대 + 8자 개수)
        
        // 막대
        // input 0 output 0 -> input 1 output 0
        // input 0 output 1 -> input 1 output 1
        // input 1 output 1 -> input 2 output 1
        // output 0 노드 1개 존재
        if output[node, default: 0] == 0 {
            result[2] += 1
        }
        
        // 8자
        // input 1 output 1 -> input 2 output 1
        // input 2 output 2 -> input 3 output 2
        // input >= 2 output 2 노드 1개 존재
        if output[node, default: 0] == 2 && input[node, default: 0] >= 2 {
            result[3] += 1
        }
    }
    result[1] = output[result[0], default: 0] - (result[2] + result[3])
        
    return result
}