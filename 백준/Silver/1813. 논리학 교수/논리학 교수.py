from collections import defaultdict

n = int(input())
arr = list(map(int, input().split()))

defdict = defaultdict(int)
for elem in arr:
    defdict[elem] += 1

result = -1

for elem in defdict:
    if elem == defdict[elem]:
        result = max(result, elem)

if result == -1 and 0 not in defdict:
    result = 0

print(result)