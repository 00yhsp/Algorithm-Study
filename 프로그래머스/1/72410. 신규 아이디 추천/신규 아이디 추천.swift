import Foundation

func solution(_ new_id:String) -> String {
    // 1
    var fixed_id = new_id.lowercased()
    
    // 2
    let allowed = "abcdefghijklmnopqrstuvwxyz0123456789-_."
    fixed_id = fixed_id.filter { allowed.contains($0) }
    
    // 3
    while fixed_id.contains("..") { 
        fixed_id = fixed_id.replacingOccurrences(of: "..", with: ".") 
    }
    
    // 4
    if fixed_id.first == "." { fixed_id.removeFirst() }
    if fixed_id.last == "." { fixed_id.removeLast() }
    
    // 5
    if fixed_id.isEmpty { fixed_id = "a" }
    
    // 6
    while fixed_id.count >= 16 {
        fixed_id.removeLast()
    }
    if fixed_id.last == "." { fixed_id.removeLast() }
    
    // 7
    while fixed_id.count <= 2 {
        fixed_id.append(fixed_id.last!)
    }
    return fixed_id
}