let arr = readLine()!.split(separator: " ").map { Int($0)! }

var minutes = arr[0] * 60 + arr[1] - 45

if minutes < 0 { minutes += 1440 }

let (quotient, remainder) = minutes.quotientAndRemainder(dividingBy: 60)

print("\(quotient) \(remainder)")
