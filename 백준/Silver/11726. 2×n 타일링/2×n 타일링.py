import sys
input = sys.stdin.readline
print = sys.stdout.write

dp = [0 for i in range(1001)]
dp[1] = 1
dp[2] = 2

n = int(input())

if n >= 3:
    for i in range(3, n + 1):
        dp[i] = (dp[i - 1] + dp[i - 2]) % 10007

print(f"{dp[n]}\n")
