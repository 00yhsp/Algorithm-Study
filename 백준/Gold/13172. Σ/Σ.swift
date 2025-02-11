let mod = 1_000_000_007
let m = Int(readLine()!)!
var result = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var (n, s) = (input[0], input[1])

    let g = gcd(n, s)
    n /= g
    s /= g

    let invN = modExp(n, mod - 2)

    result = (result + (s * invN) % mod) % mod
}

print(result)

func modExp(_ base: Int, _ exp: Int) -> Int {
    if exp == 0 { return 1 }
    if exp == 1 { return base % mod }

    let half = modExp(base, exp / 2)
    let halfSquared = (half * half) % mod

    if exp % 2 == 0 {
        return halfSquared
    } else {
        return (halfSquared * base) % mod
    }
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}
