import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()
    var candidates = [String: Int]()
    
    func dfs(_ currentCourse: String, _ k: Int, _ index: Int, _ sortedOrder: [String]) {
        if currentCourse.count == k {
            candidates[currentCourse, default: 0] += 1
            return
        }
        if index == sortedOrder.count {
            return
        }
        
        for i in index..<sortedOrder.count {
            dfs(currentCourse + sortedOrder[i], k, i + 1, sortedOrder)
        }
    }
    
    for k in course {
        for order in orders {
            let sortedOrder = order.map(String.init).sorted()
            dfs("", k, 0, sortedOrder)
        }
        
        let selected = candidates.max(by: { $0.value < $1.value })?.value
        if let selected = selected, selected >= 2 { 
            candidates = candidates.filter { $0.value == selected } 
            candidates.forEach { result.append($0.key) }
        }
        
        candidates = [:]
    }
    
    return result.sorted()
}