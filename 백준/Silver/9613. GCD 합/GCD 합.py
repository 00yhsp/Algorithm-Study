from itertools import combinations


def gcd(a, b):
    if b == 0:
        return a
    return gcd(b, a % b)


for _ in range(int(input())):
    result = 0
    comb = combinations(list(map(int, input().split()))[1:], 2)
    for elem in comb:
        result += gcd(elem[0], elem[1])
    print(result)

