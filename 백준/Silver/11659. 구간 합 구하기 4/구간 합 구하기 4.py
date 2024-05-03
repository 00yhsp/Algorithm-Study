import sys

input = sys.stdin.readline

n, m = map(int, input().split())

li = list(map(int, input().split()))

sum_li = [0, li[0]]

for i in range(n - 1):
    sum_li.append(sum_li[-1] + li[i + 1])

for _ in range(m):
    i, j = map(int, input().split())
    print(sum_li[j] - sum_li[i - 1])