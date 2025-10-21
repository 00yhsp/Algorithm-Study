func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = Array(str1.lowercased())
    let str2 = Array(str2.lowercased())
    var set1 = Set<String>()
    var set2 = Set<String>()
    var dict1 = [String: Int]()
    var dict2 = [String: Int]()
    
    for i in 0..<str1.count - 1 {
        if "a" > String(str1[i]) || String(str1[i]) > "z"
            || "a" > String(str1[i + 1]) || String(str1[i + 1]) > "z" { 
            continue    
        }
        let str = String(str1[i]) + String(str1[i + 1])
        set1.insert(str)
        dict1[str, default: 0] += 1
    }
    
    for i in 0..<str2.count - 1 {
        if "a" > String(str2[i]) || String(str2[i]) > "z"
            || "a" > String(str2[i + 1]) || String(str2[i + 1]) > "z" { 
            continue    
        }
        let str = String(str2[i]) + String(str2[i + 1])
        set2.insert(str)
        dict2[str, default: 0] += 1
    }
    
    if set1.isEmpty && set2.isEmpty { return 65536 }
    
    let intersection = set1.intersection(set2)
    let union = set1.union(set2)
    
    var intersectionCount = 0
    var unionCount = 0 
    
    for s in intersection {
        intersectionCount += min(dict1[s]!, dict2[s]!)
    }
    
    for s in union {
        unionCount += max(dict1[s] ?? 0, dict2[s] ?? 0)
    }
    
    return Int(Double(intersectionCount) / Double(unionCount) * 65536)
}