import sys
input = sys.stdin.readline

t = int(input())

for _ in range(t):  # 50
    n = int(input())
    li = []
    for _ in range(n):  # 10^4
        li.append(input().rstrip())
    li.sort(key=lambda x: len(x))
    flag = "YES"
    dic = dict()
    for s in li:
        for i in range(len(s)):
            if s[:i + 1] in dic:
                flag = "NO"
                break
        if flag == "YES":
            dic[s] = True
    print(flag)
