import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    let coord = [
        "1": (0, 0), "2": (0, 1), "3": (0, 2),
        "4": (1, 0), "5": (1, 1), "6": (1, 2),
        "7": (2, 0), "8": (2, 1), "9": (2, 2),
        "*": (3, 0), "0": (3, 1), "#": (3, 2),
    ]
    
    let left = Set([1, 4, 7])
    let right = Set([3, 6, 9])
    
    var curL = "*"
    var curR = "#"
    
    for number in numbers {
        if left.contains(number) {
            curL = String(number)
            result.append("L")
        } else if right.contains(number) {
            curR = String(number)
            result.append("R")
        } else {
            let lDist = abs(coord[curL]!.0 - coord[String(number)]!.0) + 
                        abs(coord[curL]!.1 - coord[String(number)]!.1)
            let rDist = abs(coord[curR]!.0 - coord[String(number)]!.0) + 
                        abs(coord[curR]!.1 - coord[String(number)]!.1)
            
            if lDist == rDist {
                if hand == "left" {
                    curL = String(number)
                    result.append("L")
                } else {
                    curR = String(number)
                    result.append("R")
                }
            } else if lDist < rDist {
                curL = String(number)
                result.append("L")
            } else {
                curR = String(number)
                result.append("R")
            }   
        }
    }
    
    return result
}