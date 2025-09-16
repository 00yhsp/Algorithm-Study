board = []
black = [
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
]

white = [
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"],
    ["W", "B", "W", "B", "W", "B", "W", "B"],
    ["B", "W", "B", "W", "B", "W", "B", "W"]
]

n, m = map(int, input().split())
for _ in range(0, n):
    board.append(list(input()))
count = 64
for r in range(0, n-7):
    for c in range(0, m-7):
        whiteCount = 0
        blackCount = 0
        
        for row in range(0, 8):
            for col in range(0, 8):
                if white[row][col] != board[r + row][c + col]:
                    whiteCount += 1
                if black[row][col] != board[r + row][c + col]:
                    blackCount += 1
        
        count = min(count, whiteCount, blackCount)

print(count)
                    