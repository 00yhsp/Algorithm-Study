var n = Int(readLine()!)!

if n.isMultiple(of: 5) {
    print(n / 5)
} else {
    var count = 0
    while true {
        n -= 3
        count += 1

        if n < 0 {
            print(-1)
            break
        } else if n == 0 {
            print(count)
            break
        } else if n.isMultiple(of: 5) {
            count += n / 5
            print(count)
            break
        }
    }
}
