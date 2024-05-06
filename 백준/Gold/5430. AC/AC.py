import sys
from collections import deque

input = sys.stdin.readline

T = int(input())

for _ in range(T):
    lr_flag = True
    err_flag = False
    p = input().rstrip()
    n = int(input())
    deq = deque(input().strip("[").rstrip("]\n").split(sep=","))
    for c in p:
        if c == 'R':
            lr_flag = not lr_flag
        if c == 'D':
            if len(deq) == 0 or (len(deq) == 1 and deq[0] == ''):
                err_flag = True
                break
            if lr_flag:
                deq.popleft()
            if not lr_flag:
                deq.pop()
    if err_flag:
        print("error")
        continue
    length = len(deq)
    print("[", end='')
    if length == 0:
        print("]")
        continue
    if lr_flag:
        for i in range(length):
            if i == length - 1:
                print(deq.popleft(), end="]\n")
            else:
                print(deq.popleft(), end=",")
    else:
        for i in range(length):
            if i == length - 1:
                print(deq.pop(), end="]\n")
            else:
                print(deq.pop(), end=",")
