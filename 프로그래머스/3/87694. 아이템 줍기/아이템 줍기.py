from collections import deque

def solution(rectangle, characterX, characterY, itemX, itemY):
    scaled_rect = [[r[0]*2, r[1]*2, r[2]*2, r[3]*2] for r in rectangle]
    board = [[0] * 101 for _ in range(101)]
    
    for rect in scaled_rect:
        x1, y1, x2, y2 = rect
        for i in range(y1, y2 + 1):
            if i == y1 or i == y2:
                for j in range(x1, x2 + 1):
                    board[i][j] = 1
            else:
                for j in range(x1, x2 + 1):
                    if j == x1 or j == x2:
                        board[i][j] = 1
                    else:
                        board[i][j] = 0
                        
    for rect in scaled_rect:
        x1, y1, x2, y2 = rect
        for i in range(y1 + 1, y2):
            for j in range(x1 + 1, x2):
                board[i][j] = 0

    startX, startY = characterX * 2, characterY * 2
    endX, endY = itemX * 2, itemY * 2

    queue = deque()
    queue.append((startX, startY, 0))
    board[startY][startX] = 0  

    result = 15000
    directions = [(0, -1), (0, 1), (1, 0), (-1, 0)]
    
    while queue:
        cx, cy, cd = queue.popleft()
        if cx == endX and cy == endY:
            result = min(result, cd)
        for dx, dy in directions:
            nx = cx + dx
            ny = cy + dy
            if nx < 0 or nx > 100 or ny < 0 or ny > 100:
                continue
            if board[ny][nx] == 1:
                board[ny][nx] = 0
                queue.append((nx, ny, cd + 1))
                
    return result // 2