import Foundation

enum Command: String {
    case enter = "Enter"
    case leave = "Leave"
    case change = "Change"
}

func solution(_ record:[String]) -> [String] {
    var uidNameTable = [String: String]()
    var logs = [(Command, String)]()
    
    func description(comm: Command, uid: String) -> String {
        switch comm {
        case .enter: 
            return uidNameTable[uid]! + "님이 들어왔습니다."
        case .leave:
            return uidNameTable[uid]! + "님이 나갔습니다."
        default:
            return ""
        }
    }
    
    for r in record {
        let components = r.components(separatedBy: " ")
        let comm = Command(rawValue: components[0])!
        switch comm {
        case .enter:
            let (uid, name) = (components[1], components[2])
            logs.append((comm, uid))
            uidNameTable[uid] = name
        case .leave:
            let uid = components[1]
            logs.append((comm, uid))
        case .change:
            let (uid, name) = (components[1], components[2])
            uidNameTable[uid] = name
        }
    }
    
    return logs.map { description(comm: $0.0, uid: $0.1) }
}