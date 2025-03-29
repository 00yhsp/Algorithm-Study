import Foundation

func solution(_ word:String) -> Int {
    let chrs = ["A", "E", "I", "O", "U"]
    var count = 0
    var result = 0
    func dfs(_ current: String) {
        if !current.isEmpty { count += 1 }
        if current == word { result = count }
        if current.count == 5 { return }  
        
        for c in chrs {
            if current.count < 5 {
                dfs(current + c)   
            }
        }
    }
    dfs("")
    return result 
}