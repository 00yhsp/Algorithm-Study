import sys

input = sys.stdin.readline
print = sys.stdout.writelines

my_dict = {}
n, m = map(int, input().split())
for _ in range(n):
    k, v = input().rstrip().split()
    my_dict[k] = v
for _ in range(m):
    k = input().rstrip()
    print(f"{my_dict.get(k)}\n")
