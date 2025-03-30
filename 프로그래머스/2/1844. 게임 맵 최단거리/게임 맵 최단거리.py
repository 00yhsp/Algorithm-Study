from collections import deque

def solution(maps):
    queue = deque()
    rowCount = len(maps)
    colCount = len(maps[0])
    directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    answer = 10001
    maps[0][0] = 0
    queue.append((0, 0, 1))
    
    while queue:
        cR, cC, cD = queue.popleft()
        if cR == rowCount - 1 and cC == colCount - 1:
            answer = min(answer, cD)
        for dR, dC in directions:
            nR = cR + dR
            nC = cC + dC
            if nR < 0 or nC < 0 or nR >= rowCount or nC >= colCount or maps[nR][nC] == 0:
                continue
            maps[nR][nC] = 0
            queue.append((nR, nC, cD + 1))
            
    if answer == 10001:
        return -1
    return answer