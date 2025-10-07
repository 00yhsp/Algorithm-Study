import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var send = [String: Set<String>]()
    var receive = [String: Set<String>]()
    var banned = Set<String>()
    
    report.forEach {
        let components = $0.components(separatedBy: " ")
        send[components[0], default: .init()].insert(components[1])
        receive[components[1], default: .init()].insert(components[0])
    }
    
    receive.forEach { key, value in
        if value.count >= k { banned.insert(key) }        
    }
    
    return id_list
            .map { send[$0, default: .init()].intersection(banned).count }
}