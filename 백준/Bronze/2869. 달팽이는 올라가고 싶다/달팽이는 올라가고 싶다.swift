let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (a, b, v) = (input[0], input[1], input[2])
let quotient = (v - a) / (a - b)
let remainder = (v - a) % (a - b)
print(remainder == 0 ? quotient + 1 : quotient + 2)