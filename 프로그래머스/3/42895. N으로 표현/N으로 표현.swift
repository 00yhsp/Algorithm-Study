import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number { return 1 }
    
    var dp = Array(repeating: Set<Int>(), count: 9)
    
    for i in 1...8 {
        let concatenated = Int(String(repeating: String(N), count: i))!
        dp[i].insert(concatenated)
        
        for j in 1..<i {
            for a in dp[j] {
                for b in dp[i - j] {
                    dp[i].insert(a + b)
                    dp[i].insert(a - b)
                    dp[i].insert(a * b)
                    if b != 0 { dp[i].insert(a / b) }
                }
            }
        }
        
        if dp[i].contains(number) { return i }
    }
    return -1
}