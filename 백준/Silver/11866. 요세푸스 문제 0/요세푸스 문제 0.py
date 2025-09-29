from collections import deque

n, k = map(int, input().split())

queue = deque()

for i in range(1, n + 1):
    queue.append(i)

counter = 0

print("<", end="")

while queue:
    counter += 1
    popped = queue.popleft()
    if counter % k == 0:
        print(popped, end="")
        if queue:
           print(", ", end="")
    else:
        queue.append(popped)

print(">")