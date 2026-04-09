import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var pairs = [[String]]()
    var table = [String: [String: Int]]()
    var giftNumbers = [String: Int]()
    var results = [String: Int]()
    
    func combination(_ selected: [String], _ start: Int) {
        if selected.count == 2 {
            pairs.append(selected)
            return
        }
        if start == friends.count { return }
  
        for i in start..<friends.count {
            combination(selected + [friends[i]], i + 1)            
        }
    }
    
    for gift in gifts {
        let splited = gift.components(separatedBy: " ")
        let (sender, receiver) = (splited[0], splited[1])
        table[sender, default: [:]][receiver, default: 0] += 1
        giftNumbers[sender, default: 0] += 1
        giftNumbers[receiver, default: 0] -= 1
    }
    combination([], 0)
    
    for pair in pairs {
        let a = table[pair[0], default: [:]][pair[1], default: 0]
        let b = table[pair[1], default: [:]][pair[0], default: 0]
        
        if a == b {
            let aNum = giftNumbers[pair[0], default: 0]
            let bNum = giftNumbers[pair[1], default: 0]
            if aNum == bNum { 
                continue 
            } else if aNum > bNum {
                results[pair[0], default: 0] += 1
            } else {
                results[pair[1], default: 0] += 1
            }
        } else if a > b {
            results[pair[0], default: 0] += 1
        } else {
            results[pair[1], default: 0] += 1
        }
    } 
    
    return results.values.max() ?? 0
}