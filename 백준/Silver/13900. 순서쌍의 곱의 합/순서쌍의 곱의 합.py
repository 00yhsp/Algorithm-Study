input()
li = list(map(int, input().split()))
s = sum(li)
result = 0
for n in li:
    s = s - n
    result += n * s

print(result)