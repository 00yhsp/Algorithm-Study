import sys
input = sys.stdin.readline

n = int(input())
arr = []

for i in range(n):
    arr.append((int(input()), i))

m = 0
sorted_arr = sorted(arr)

for i in range(n):
    if m < sorted_arr[i][1] - i:
        m = sorted_arr[i][1] - i

print(m + 1)