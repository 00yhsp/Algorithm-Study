let n = Int(readLine()!)!

for _ in 0..<n {
    let str = readLine()!

    var continuous = 0
    var total = 0

    for elem in str {
        if elem == "O" {
            continuous += 1
            total += continuous
        } else {
            continuous = 0
        }
    }

    print(total)
}
