import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func dfs(_ sum: Int, _ idx: Int) {
        if idx == numbers.count {
            if target == sum { result += 1 }
            return
        }
        dfs(sum + numbers[idx], idx + 1)
        dfs(sum - numbers[idx], idx + 1)
    }
    
    dfs(0, 0)

    return result
}