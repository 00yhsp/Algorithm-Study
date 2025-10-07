import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var sended = [String:[String:Int]]()
    var received = [String:[String:Int]]()
    var sendedCount = [String: Int]()
    var receivedCount = [String: Int]()
    var pairs = [(String, String)]()
    var nextGiftCount = [String: Int]()
    
    for gift in gifts {
        let splited = gift.components(separatedBy: " ")
        let (sender, receiver) = (splited[0], splited[1])
        sended[sender, default: [:]][receiver, default: 0] += 1
        received[receiver, default: [:]][sender, default: 0] += 1
        sendedCount[sender, default: 0] += 1
        receivedCount[receiver, default: 0] += 1
    }
    for i in friends.indices {
        for j in (i + 1)..<friends.count {
            pairs.append((friends[i], friends[j]))
        }
    }
    for pair in pairs {
        let sendedA = sended[pair.0, default: [:]][pair.1, default: 0]
        let sendedB = sended[pair.1, default: [:]][pair.0, default: 0]

        if sendedA == sendedB {
            let receivedA = receivedCount[pair.0, default: 0]
            let sendedA = sendedCount[pair.0, default: 0]
            let receivedB = receivedCount[pair.1, default: 0]
            let sendedB = sendedCount[pair.1, default: 0]

            let factorA = sendedA - receivedA
            let factorB = sendedB - receivedB

            if factorA == factorB { continue }
            else if factorA > factorB { nextGiftCount[pair.0, default: 0] += 1 }
            else { nextGiftCount[pair.1, default: 0] += 1 }
        } else {
            if sendedA > sendedB { nextGiftCount[pair.0, default: 0] += 1 }
            else { nextGiftCount[pair.1, default: 0] += 1 }
        }
    }
    
    if let maxCount = nextGiftCount.values.max() {
        return maxCount
    } else { 
        return 1 - 1 
    }
}