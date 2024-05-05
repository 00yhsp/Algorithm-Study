import sys

input = sys.stdin.readline

li = []
n = int(input())
result = 0
start = 0
end = 0

for i in range(n):
    li.append(tuple(map(int, input().split())))

li.sort(key=lambda x: (x[1], x[0]))

for elem in li:
    if elem[0] >= end:
        end = elem[1]
        result += 1

print(result)
