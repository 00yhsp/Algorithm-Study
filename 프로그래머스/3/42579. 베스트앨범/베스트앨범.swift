import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    let count = genres.count
    var totalPlays = [String: [(Int, Int)]]()
    var results = [Int]()
    
    for i in 0..<count {
        totalPlays[genres[i], default: []].append((i, plays[i]))
    }
    let sortedKeys = totalPlays.keys.sorted { 
        totalPlays[$0, default: []].reduce(0) { $0 + $1.1 } > 
        totalPlays[$1, default: []].reduce(0) { $0 + $1.1 }
    }
    
    for key in sortedKeys {
        let arr = totalPlays[key, default: []].sorted { 
            if $0.1 == $1.1 { return $0.0 < $1.0 }
            else { return $0.1 > $1.1 }
        }
        if arr.count == 1 { results.append(arr[0].0) }
        else { results.append(arr[0].0); results.append(arr[1].0); }
    }
    
    return results
}