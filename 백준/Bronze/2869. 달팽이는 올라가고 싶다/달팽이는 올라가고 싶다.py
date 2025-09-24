(a, b, v) = map(int, input().split())

quotient = (v - a) // (a - b)
remainder = (v - a) % (a - b)

print(quotient + 1 if remainder == 0 else quotient + 2)  