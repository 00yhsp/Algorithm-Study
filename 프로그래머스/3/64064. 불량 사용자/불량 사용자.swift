import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var results = [[String]]()
    
    for ban in banned_id {
        let c = user_id
        .filter { uid in 
            guard uid.count == ban.count else { return false }            
            for (chr1, chr2) in zip(ban, uid) {
                if (chr1 != chr2) && !(chr1 == "*" || chr2 == "*") {
                    return false
                }
            }
            return true
        }

        results.append(c)
    }
    
    var flatten = [String: Bool]()
    let candidates = Set(results.flatMap { $0 })
    candidates.forEach { flatten[$0] = false }
    
    var path = [String]()
    var result = Set<Set<String>>()
    func dfs(_ start: Int) {
        if path.count == banned_id.count { 
            result.insert(Set(path))
            return
        }
        if start == banned_id.count { return }

        for id in results[start] where flatten[id] != true {
            flatten[id] = true
            path.append(id)
            dfs(start + 1)
            _ = path.popLast()
            flatten[id] = false
        }
    }
    dfs(0)

    return result.count
}