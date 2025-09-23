input()
isPrime = [True for i in range(1001)]
isPrime[1] = False

for i in range(2, 1001):
    if not isPrime[i]:
        continue
    for j in range(2 * i, 1001, i):
        isPrime[j] = False

arr = list(map(int, input().split()))

count = 0

for i in arr:
    if isPrime[i]:
        count += 1

print(count)