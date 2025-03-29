import Foundation

func solution(_ name:String) -> Int {
    var count = name.count
    var name = Array(name) 
    var result = 0
    var differences = 0
    
    for i in 0..<count {
        let p = Int(name[i].asciiValue!) - 65
        let m = abs(Int(name[i].asciiValue!) - 91)
        differences += min(m, p)
    }
    
    var horizontal = count - 1
    for i in 0..<count {
        var next = i + 1
        while next < count, name[next] == Character("A") { next += 1 }
        horizontal = min(horizontal, i + count - next + min(i, count - next))
    }
    
    return differences + horizontal
}