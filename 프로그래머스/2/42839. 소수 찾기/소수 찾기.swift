import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = generateNumbers(numbers)
    let max = numbers.max()!
    let prime = filterPrime(max)
    
    let result = numbers.filter { prime[$0] }
    return result.count
}

func generateNumbers(_ digits: String) -> Set<Int> {
    var results = Set<Int>()
    let chars = Array(digits)
    var visited = Array(repeating: false, count: chars.count)
    
    func backtrack(_ current: String) {
        if !current.isEmpty, let num = Int(current) {
            results.insert(num)
        }
        for i in 0..<chars.count {
            if !visited[i] {
                visited[i] = true
                backtrack(current + String(chars[i]))
                visited[i] = false
            }
        }
    }
    
    backtrack("")
    return results
}

func filterPrime(_ n: Int) -> [Bool] {
    var prime = [Bool](repeating: true, count: 10000000)
    prime[0] = false
    prime[1] = false
    
    if n == 1 { return [false, false] }
    if n == 2 { return [false, false, true] }
    if n == 3 { return [false, false, true, true] }
    
    let limit = max(Int(sqrt(Double(n))), 2)
    
    for i in 2...limit {
        if prime[i] {
            for i in stride(from: i * i, through: n, by: i) {
                prime[i] = false
            }
        }
    }
    return prime
}