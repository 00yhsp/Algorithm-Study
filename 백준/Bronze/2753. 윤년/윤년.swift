let n = Int(readLine()!)!

if n % 400 == 0 || (n % 100 != 0 && n % 4 == 0) {
    print(1)
} else {
    print(0)
}
