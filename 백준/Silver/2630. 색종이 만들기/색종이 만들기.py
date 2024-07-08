import sys
input = sys.stdin.readline

blue = 0
white = 0

n = int(input())
board = [list(map(int, input().split())) for _ in range(n)]


def check(rs, cs, size):
    global blue, white
    color = board[rs][cs]
    for i in range(rs, rs + size):
        for j in range(cs, cs + size):
            if board[i][j] != color:
                return False
    if color == 1:
        blue += 1
    else:
        white += 1
    return True


def recursion(rs, cs, size):
    if check(rs, cs, size):
        return
    half = size // 2
    recursion(rs, cs, half)
    recursion(rs, cs + half, half)
    recursion(rs + half, cs, half)
    recursion(rs + half, cs + half, half)


recursion(0, 0, n)


print(white)
print(blue)