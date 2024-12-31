import Foundation

while true {
    let arr = readLine()!.split(separator: " ").map { Double($0)! }.sorted()
    let (a, b, c) = (arr[0], arr[1], arr[2])
    if a == 0 && b == 0 && c == 0 { break }

    if (pow(a + b, 2) - (2 * a * b) == pow(c, 2)) && !(a == 1 && b == 1 && c == 1) {
        print("right")
    } else {
        print("wrong")
    }
}
