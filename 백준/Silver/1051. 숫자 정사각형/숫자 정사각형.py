n, m = map(int, input().split())

arr = []
for _ in range(n):
    arr.append(list(input()))
max_size = min(n, m)

result = 0

for size in range(0, max_size + 1):
    for i in range(n - size):
        for j in range(m - size):
            if arr[i][j] == arr[i + size][j] == arr[i][j + size] == arr[i + size][j + size]:
                result = size

print((result + 1) ** 2)
