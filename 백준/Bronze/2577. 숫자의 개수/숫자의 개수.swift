let (a, b, c) = (Int(readLine()!)!, Int(readLine()!)!, Int(readLine()!)!)

var mult = a * b * c

var dict = [Int: Int]()

while mult != 0 {
    let digit = mult % 10
    dict[digit] = (dict[digit] ?? 0) + 1
    mult /= 10
}

for i in 0...9 {
    print(dict[i] ?? 0)
}
