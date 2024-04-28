import sys

input = sys.stdin.readline

result = [0] * 1000001

n = int(input())

result[1] = 0
result[2] = 1
result[3] = 1

for i in range(4, n + 1):
    arr = [result[i - 1]]
    if i % 3 == 0:
        arr.append(result[i//3])
    if i % 2 == 0:
        arr.append(result[i // 2])
    result[i] = min(arr) + 1

print(result[n])