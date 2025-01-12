let t = Int(readLine()!)!

for _ in 1...t {
    print(solution())
}

func solution() -> Int {
    let mnxy = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnxy[0], n = mnxy[1], x = mnxy[2], y = mnxy[3]

    let max = lcm(m, n)
    for i in stride(from: x, through: max, by: m) {
        if i % n == y || (i % n == 0 && y == n) { return i }
    }
    return -1
}

func gcd(_ a: Int, _ b: Int) -> Int {
    guard b != 0 else { return a }
    let r = a % b
    return gcd(b, r)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a ,b)
}
