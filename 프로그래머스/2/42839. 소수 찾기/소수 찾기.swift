import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = makeNumbers(numbers)
    let isPrime = sieve(numbers.last!)
    return numbers.filter { isPrime[$0] }.count
}

func makeNumbers(_ numbers: String) -> [Int] {
    let digits = numbers.compactMap { $0.wholeNumberValue }
    var visited = Array(repeating: false, count: digits.count)
    var results = Set<Int>()

    func dfs(_ value: Int, _ depth: Int) {
        if depth > 0 { results.insert(value) }

        for i in digits.indices {
            if visited[i] { continue }

            visited[i] = true
            dfs(value * 10 + digits[i], depth + 1)
            visited[i] = false
        }
    }

    dfs(0, 0)
    return results.sorted()
}

func sieve(_ limit: Int) -> [Bool] {
    var isPrime = Array(repeating: true, count: limit + 1)
    isPrime[0] = false

    guard limit >= 1 else { return isPrime }
    isPrime[1] = false

    var i = 2
    while i * i <= limit {
        if isPrime[i] {
            var multiple = i * i
            while multiple <= limit {
                isPrime[multiple] = false
                multiple += i
            }
        }
        i += 1
    }

    return isPrime
}