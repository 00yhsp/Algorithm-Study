import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1]

if n < 2 { exit(0) }

var prime = [Bool](repeating: true, count: n + 1)
prime[1] = false

let limit = max(Int(sqrt(Double(n))), 2)

for i in 2...limit {
    if prime[i] {
        for j in stride(from: i * i, through: n, by: i) {
            prime[j] = false
        }
    }
}

for i in m...n {
    if prime[i] { print(i) }
}
