import sys
from bisect import bisect_left, bisect_right

input = sys.stdin.readline

n, m = map(int, input().split())

arr = sorted(list(map(int, input().split())))

for i in range(m):
    s, e = map(int, input().split())
    print(bisect_right(arr, e) - bisect_left(arr, s))