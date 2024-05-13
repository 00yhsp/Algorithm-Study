import sys

input = sys.stdin.readline

n = int(input())

a = sorted(list(map(int, input().split())))

m = int(input())

m_arr = list(map(int, input().split()))


def binary_search(s, e, v):
    m = (s + e) // 2
    if v == a[m]:
        return 1
    if s >= e:
        return 0
    if v < a[m]:
        return binary_search(s, m - 1, v)
    if v > a[m]:
        return binary_search(m + 1, e, v)



for elem in m_arr:
    print(binary_search(0, n - 1, elem))
