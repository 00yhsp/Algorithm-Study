n, m = map(int, input().split())

v = []

visited = [False for i in range(10)]


def f(phase: int):
    if phase == m:
        print(' '.join(map(str, v)))
        return
    idx = 1
    if phase > 0:
        idx = v[phase - 1]
    for i in range(idx, n + 1):
        if visited[i]:
            continue
        v.append(i)
        visited[i] = True
        f(phase + 1)
        visited[i] = False
        v.pop()


f(0)
