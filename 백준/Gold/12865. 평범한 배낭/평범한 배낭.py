import sys

input = sys.stdin.readline

n, k = map(int, input().split())

weight = [0] * (n + 1)
value = [0] * (n + 1)

dp = [[0] * (k + 1) for _ in range(n + 1)]

for i in range(1, n + 1):
    weight[i], value[i] = map(int, input().split())

for i in range(1, n + 1):
    if weight[i] > k:
        for w in range(1, k + 1):
            dp[i][w] = dp[i - 1][w]
    else :
        for w in range(1, weight[i]):
            dp[i][w] = dp[i - 1][w]
        for w in range(weight[i], k + 1):
            dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weight[i]] + value[i])

print(dp[n][k])