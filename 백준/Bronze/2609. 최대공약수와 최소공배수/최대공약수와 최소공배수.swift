let arr = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (arr[0], arr[1])

print(gcd(a, b))
print(lcm(a, b))

func gcd(_ a: Int, _ b: Int) -> Int {
    guard b != 0 else { return a }
    return gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
