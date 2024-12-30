let n = Int(readLine()!)!

for _ in 0..<n {
    let arr = readLine()!.split(separator: " ")
    let (r, s) = (Int(arr[0])!, arr[1])

    for elem in s {
        print(String(repeating: elem, count: r), terminator: "")
    }
    print()
}
