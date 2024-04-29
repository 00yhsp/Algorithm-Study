import sys
from collections import deque

input = sys.stdin.readline
write = sys.stdout.write

n, m = map(int, input().split())
start = (0, 0)
input_map = []
visited = [[-1] * m for i in range(n)]
for i in range(n):
    row = list(map(int, input().split()))
    if 2 in row:
        start = (i, row.index(2))
    input_map.append(row)
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]


def BFS(i, j):
    global visited, input_map
    visited[i][j] = 0
    q = deque()
    q.append((i, j))
    while q:
        x, y = q.popleft()
        for i in range(4):
            nx = dx[i] + x
            ny = dy[i] + y
            if 0 <= nx < n and 0 <= ny < m and visited[nx][ny] == -1:
                if input_map[nx][ny] == 0:
                    visited[nx][ny] = 0
                else:
                    visited[nx][ny] = visited[x][y] + 1
                    q.append((nx, ny))


BFS(start[0], start[1])

for i in range(n):
    for j in range(m):
        if input_map[i][j] == 0 and visited[i][j] == -1:
            visited[i][j] = 0

for row in visited:
    for i in range(len(row)):
        if i != len(row) - 1:
            print(row[i], end=" ")
        else:
            print(row[i])
