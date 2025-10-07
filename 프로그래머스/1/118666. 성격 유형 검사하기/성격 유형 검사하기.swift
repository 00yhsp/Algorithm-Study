import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let survey = survey.map { Array($0).map { String($0) } }
    var scores = [String: Int]()
    var result = ""
    
    for (idx, choice) in choices.enumerated() {
        if choice < 4 {
            scores[survey[idx][0], default: 0] += 4 - choice
        } else {
            scores[survey[idx][1], default: 0] += choice - 4
        }
    }
    
    if scores["R", default: 0] >= scores["T", default: 0] {
        result.append("R")
    } else {
        result.append("T")
    }
    if scores["C", default: 0] >= scores["F", default: 0] {
        result.append("C")
    } else {
        result.append("F")
    }
    
    if scores["J", default: 0] >= scores["M", default: 0] {
        result.append("J")
    } else {
        result.append("M")
    }
    
    if scores["A", default: 0] >= scores["N", default: 0] {
        result.append("A")
    } else {
        result.append("N")
    }
    
    return result
}