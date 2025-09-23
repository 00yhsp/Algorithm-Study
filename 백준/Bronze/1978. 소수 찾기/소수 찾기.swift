_ = readLine()

var isPrime = [Bool](repeating: true, count: 1001)
isPrime[1] = false

for i in 2...1000 {
    if !isPrime[i] { continue }
    for j in stride(from: 2 * i, through: 1000, by: i) {
        isPrime[j] = false
    }
}

let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

print(arr.filter { isPrime[$0] }.count)