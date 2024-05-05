import sys

input = sys.stdin.readline

n, m = map(int, input().split())

li = [0] + list(map(int, input().split()))

sum_li = [0] * (n + 1)

for i in range(1, n + 1):
    sum_li[i] = sum_li[i - 1] + li[i]

result = 0

for i in range(1, n + 1):
    sum_li[i] %= m
    if sum_li[i] == 0:
        result += 1

remainder = [0] * m

for i in range(1, n + 1):
    remainder[sum_li[i]] += 1

for elem in remainder:
    result += elem * (elem - 1) // 2

print(result)