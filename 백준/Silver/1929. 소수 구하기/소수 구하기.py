MAX_N = 10**6
isErased = [False] * (MAX_N + 1)


def sieve(N):
    isErased[0] = True
    isErased[1] = True
    for p in range(2, int(N ** 0.5) + 1):
        if isErased[p]:
            continue
        for j in range(p * p, N + 1, p):
            isErased[j] = True


m, n = map(int, input().split())
sieve(n)
for i in range(m, n + 1):
    if not isErased[i]:
        print(i)