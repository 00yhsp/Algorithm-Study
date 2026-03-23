import sys
input = sys.stdin.readline
print = sys.stdout.write

T = int(input())

dp = [0 for i in range(12)]
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in range(4, 11):
    dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]

for _ in range(T):
    n = int(input())
    print(f"{dp[n]}\n")