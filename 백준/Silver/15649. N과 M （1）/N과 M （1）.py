n, m = map(int, input().split())

v = []

visited = [False for i in range(10)]


def f(phase: int):
    if phase == m:
        print(' '.join(v))
        return
    for i in range(1, n + 1):
        if visited[i]:
            continue
        v.append(str(i))
        visited[i] = True
        f(phase + 1)
        visited[i] = False
        v.pop()


f(0)
