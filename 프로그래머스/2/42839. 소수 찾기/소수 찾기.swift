import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = generateNumber(numbers.map(String.init))
    let isPrime = generateSieve(numbers.max()!)
    
    return numbers.filter { isPrime[$0] }.count
}

func generateNumber(_ digits: [String]) -> Set<Int> {
    var numbers = Set<Int>()
    var visited = [Bool](repeating: false, count: digits.count)
    
    func dfs(_ current: String) {        
        for i in 0..<digits.count where !visited[i] {
            visited[i] = true
            
            let next = current + digits[i]
            numbers.insert(Int(next)!)
            
            dfs(next)
            
            visited[i] = false
        }
    }
    
    dfs("")
    return numbers
}

func generateSieve(_ n: Int) -> [Bool] {
    var isPrime = [Bool](repeating: true, count: n + 1)
    if n <= 3 { return [false, false, true, true] }
    isPrime[0] = false; isPrime[1] = false
    
    for i in 2...Int(sqrt(Double(n))) {
        for j in 2...n / i where isPrime[i * j] {
            isPrime[i * j] = false
        }
    }
    
    return isPrime
}