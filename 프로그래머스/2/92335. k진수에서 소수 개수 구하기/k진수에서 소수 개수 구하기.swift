import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let radix = String(n, radix: k)
    let values = radix.split(separator: "0").compactMap { Int($0) }
    var count = 0
    
    for value in values {
        if checkPrimeNumber(value) {
            count += 1
        }
    }
    
    return count
}

func checkPrimeNumber(_ num: Int) -> Bool {
    if num < 2 { return false }
    if (2...3) ~= num { return true }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
