n = int(input())
arr = []

for _ in range(0, n):
    arr.append(input())

arr = list(set(arr))

arr.sort(key=lambda x: (len(x), x))

for word in arr:
    print(word)