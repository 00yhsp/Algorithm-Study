func solution() {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    var (x, y) = arr[2].quotientAndRemainder(dividingBy: arr[0])

    if y == 0 {
        x -= 1
        y = arr[0]
    }

    x += 1

    if x < 10 {
        print("\(y)0\(x)")
    } else {
        print("\(y)\(x)")
    }
}

let n = Int(readLine()!)!

for _ in 0..<n {
    solution()
}
