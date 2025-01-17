let abc = readLine()!.split(separator: " ").map { Int($0)! }
let a = abc[0], b = abc[1], c = abc[2]

print(exponentiation(a, b, c))

func exponentiation(_ base: Int, _ exp: Int, _ mod: Int) -> Int {
    if exp == 1 { return base % mod }

    let halfMod = exponentiation(base, exp / 2, mod) % mod

    if exp % 2 == 0 {
        return (halfMod * halfMod) % mod
    } else {
        return (halfMod * halfMod % mod) * base % mod
    }
}
