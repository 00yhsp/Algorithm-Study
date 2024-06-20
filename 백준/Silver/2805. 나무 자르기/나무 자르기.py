n, m = map(int, input().split())

arr = list(map(int, input().split()))

start = 0
end = max(arr)

while start <= end:
    trees = 0
    mid = (start + end) // 2
    for elem in arr:
        if elem > mid:
            trees += elem - mid
    if trees >= m:
        start = mid + 1
    else:
        end = mid - 1

print(end)
