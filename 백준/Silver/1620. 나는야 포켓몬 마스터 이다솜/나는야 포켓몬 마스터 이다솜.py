toString = {}
toInt = {}

(n, m) = map(int, input().split())

for i in range(1, n + 1):
    name = input()
    toString[i] = name
    toInt[name] = i

for _ in range(0, m):
    line = input()
    if line[0] >= 'A' and line[0] <= 'Z':
        print(toInt[line])
    else:
        print(toString[int(line)])