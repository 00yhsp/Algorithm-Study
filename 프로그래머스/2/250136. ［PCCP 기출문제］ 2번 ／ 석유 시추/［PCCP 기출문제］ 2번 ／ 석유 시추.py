from collections import deque

def solution(land):
    answer = 0
    componentID = 0
    componentSizes = {}
    components = [[0] * len(land[0]) for _ in range(len(land))]
    directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    def bfs(r, c):
        q = deque()
        q.append((r, c))
        components[r][c] = componentID
        componentSize = 1
        
        while q:
            cR, cC = q.popleft()

            for (dR, dC) in directions:
                nR = cR + dR
                nC = cC + dC
                if nR < 0 or nR >= len(land) or nC < 0 or nC >= len(land[0]):
                    continue
                if land[nR][nC] == 1 and components[nR][nC] == 0:
                    components[nR][nC] = componentID
                    componentSize += 1
                    q.append((nR, nC))
        componentSizes[componentID] = componentSize
        
    
    for r in range(len(land)):
        for c in range(len(land[0])):
            if land[r][c] == 1 and components[r][c] == 0:
                componentID += 1
                bfs(r, c)
    
    for c in range(len(land[0])):
        total = 0
        column = []
        for r in range(len(land)):
            column.append(components[r][c])
        s = set(column)
        if 0 in s:
            s.remove(0)
        for id in s:
            total += componentSizes[id]
            answer = max(answer, total)
                
    return answer