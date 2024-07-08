import sys
input = sys.stdin.readline

m, z, p = 0, 0, 0

n = int(input())
board = [list(map(int, input().split())) for _ in range(n)]


def check(rs, cs, size):
    global m, z, p
    num = board[rs][cs]
    for i in range(rs, rs + size):
        for j in range(cs, cs + size):
            if board[i][j] != num:
                return False
    if num == 1:
        p += 1
    elif num == 0:
        z += 1
    else:
        m += 1
    return True


def recursion(rs, cs, size):
    if check(rs, cs, size):
        return
    new_size = size // 3
    recursion(rs, cs, new_size)
    recursion(rs, cs + new_size, new_size)
    recursion(rs, cs + new_size + new_size, new_size)
    recursion(rs + new_size, cs, new_size)
    recursion(rs + new_size, cs + new_size, new_size)
    recursion(rs + new_size, cs + new_size + new_size, new_size)
    recursion(rs + new_size + new_size, cs, new_size)
    recursion(rs + new_size + new_size, cs + new_size, new_size)
    recursion(rs + new_size + new_size, cs + new_size + new_size, new_size)


recursion(0, 0, n)

print(m)
print(z)
print(p)