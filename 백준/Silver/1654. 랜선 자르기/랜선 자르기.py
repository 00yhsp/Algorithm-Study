import sys
input = sys.stdin.readline

k, n = map(int, input().split())
li = []
for i in range(k):
    li.append(int(input()))
start = 0
end = max(li)

while start <= end:
    mid = (start + end) // 2
    if mid == 0:
        print(1)
        exit(0)
    cnt = 0
    for lan in li:
        cnt += lan // mid
    if cnt >= n:
        start = mid + 1
    else:
        end = mid - 1

print(end)
