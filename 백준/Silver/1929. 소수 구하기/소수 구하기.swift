let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1]

var prime = [Bool](repeating: true, count: n + 1)
prime[1] = false

for i in 2...n {
    for j in i...n {
        if i * j > n { break }
        prime[i * j] = false
    }
}

for i in m...n {
    if prime[i] { print(i) }
}
