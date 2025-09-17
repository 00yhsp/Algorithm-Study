n = int(input())
arr = list(map(int, input().split()))
maxscore = max(arr)
total = 0
for score in arr:
    total += score / maxscore * 100
print(total / n)
