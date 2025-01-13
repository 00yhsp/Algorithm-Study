import Foundation

let nrc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nrc[0], r = nrc[1], c = nrc[2]

func z(_ size: Int, _ r: Int, _ c: Int) -> Int {
    if size == 1 { return 0 }

    let half = size / 2
    if r < half && c < half {
        return z(half, r, c)
    } else if r < half && c >= half {
        return half * half + z(half, r, c - half)
    } else if r >= half && c < half {
        return 2 * half * half + z(half, r - half, c)
    } else {
        return 3 * half * half + z(half, r - half, c - half)
    }
}

let size = Int(pow(2.0, Double(n)))
print(z(size, r, c))
