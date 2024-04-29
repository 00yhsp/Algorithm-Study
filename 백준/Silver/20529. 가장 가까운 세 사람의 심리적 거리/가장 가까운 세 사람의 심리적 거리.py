import sys
from itertools import combinations

input = sys.stdin.readline

T = int(input())

for _ in range(T):
    n = int(input())
    li = list(input().split())
    result = float("inf")
    trio = combinations(li, 3)
    if len(li) > 32:
        print(0)
        continue
    for tup in trio:
        s = len(set(tup[0] + tup[1])) + len(set(tup[1] + tup[2])) + len(set(tup[0] + tup[2])) - 12
        result = min(result, s)
    print(result)
