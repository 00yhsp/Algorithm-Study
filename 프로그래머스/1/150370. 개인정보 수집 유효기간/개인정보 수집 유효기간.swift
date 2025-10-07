import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termsTable = [String: Int]()
    var dueDateTable = [String: Int]()
    let today = toDays(today)
    var results = [Int]()
    
    terms.forEach { 
        let components = $0.components(separatedBy: " ")
        termsTable[components[0]] = Int(components[1])!
    }
    
    privacies.enumerated().forEach { idx, privacy in
        let components = privacy.components(separatedBy: " ")
        let days = afterMonths(toDays(components[0]), months: termsTable[components[1]]!)
        if days <= today { results.append(idx + 1) }
    }
    
    return results
}

func toDays(_ date: String) -> Int {
    let dateComponents = date.components(separatedBy: ".").compactMap { Int($0) }
    let (year, month, day) = (dateComponents[0], dateComponents[1], dateComponents[2])
    
    return year * 12 * 28 + month * 28 + day
}

func afterMonths(_ days: Int, months: Int) -> Int {
    return days + months * 28
}