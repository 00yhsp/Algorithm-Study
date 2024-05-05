import sys

input = sys.stdin.readline

n = int(input())
m = int(input())

connected = [[] for _ in range(n + 1)]
infected = [False] * (n + 1)
stack = []
result = 0

for _ in range(m):
    a, b = map(int, input().split())
    connected[a].append(b)
    connected[b].append(a)

infected[1] = True
for elem in connected[1]:
    stack.append(elem)

while stack:
    idx = stack.pop()
    if not infected[idx]:
        infected[idx] = True
        result += 1
        for elem in connected[idx]:
            if not infected[elem]:
                stack.append(elem)

print(result)
