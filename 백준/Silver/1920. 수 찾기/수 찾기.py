input()
s = set(map(int, input().split()))
input()
arr = list(map(int, input().split()))
for elem in arr:
    print(1 if elem in s else 0)