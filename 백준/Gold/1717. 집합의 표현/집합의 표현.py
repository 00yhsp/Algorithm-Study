import sys

sys.setrecursionlimit(10 ** 5)
input = sys.stdin.readline

MN = 1000001
par = [0 for i in range(1000001)]


def init(N: int):
    for i in range(1, N + 1):
        par[i] = i


def find(x: int) -> int:
    if x == par[x]:
        return x
    par[x] = find(par[x])
    return par[x]


def unite(x: int, y: int):
    x=find(x)
    y=find(y)
    par[x] = y


n, m = map(int, input().split())
init(n)
for i in range(m, 0, -1):
    c, a, b = map(int, input().split())

    if c == 1:
        if find(a) == find(b):
            print("YES")
        else:
            print("NO")
    else:
        unite(a, b)
