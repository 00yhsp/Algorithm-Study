import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var number = number.map(String.init)
    var count = 0
    var result = [String]()
    
    for num in number {
        while let last = result.last, last < num, count < k {
            result.removeLast()
            count += 1
        }
        result.append(num)
    }
    
    for _ in 0..<k - count {
        result.removeLast()
    }
        
    return result.joined()
}