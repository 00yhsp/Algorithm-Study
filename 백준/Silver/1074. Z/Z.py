import sys

input = sys.stdin.readline

n, r, c = map(int, input().split())


def find(n, r, c):
    result = 0
    size = 2 ** n
    row, col = 0, 0

    while size > 1:
        size //= 2
        if r < row + size and c < col + size:
            continue
        elif r < row + size and c >= col + size:
            result += size * size
            col += size
        elif r >= row + size and c < col + size:
            result += size * size * 2
            row += size
        else:
            result += size * size * 3
            row += size
            col += size
    print(result)


find(2 ** n, r, c)
