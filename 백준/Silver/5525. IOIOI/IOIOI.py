n = int(input())
m = int(input())
s = input()
ioi = "I"
for i in range(n):
    ioi += "OI"
result = 0
for i in range(m - 2):
    if s[i: i + (2 * n + 1)] == ioi:
        result += 1

print(result)