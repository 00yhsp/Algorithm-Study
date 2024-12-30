var dict = [Int: Int]()

for _ in 0..<10 {
    let n = Int(readLine()!)!

    dict[n % 42] = (dict[n % 42] ?? 0) + 1
}

print(dict.count)
