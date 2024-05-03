import sys

input = sys.stdin.readline

n, m = map(int, input().split())

li = [[0] * (n + 1)]
sum_li = [[0] * (n + 1) for _ in range(n + 1)]


for _ in range(n):
    li.append([0] + list(map(int, input().split())))

for i in range(1, n + 1):
    for j in range(1, n + 1):
        sum_li[i][j] = sum_li[i - 1][j] + sum_li[i][j - 1] - sum_li[i - 1][j - 1] + li[i][j]

for _ in range(m):
    x1, y1, x2, y2 = map(int, input().split())
    print(sum_li[x2][y2] - sum_li[x1 - 1][y2] - sum_li[x2][y1 - 1] + sum_li[x1 - 1][y1 - 1])
