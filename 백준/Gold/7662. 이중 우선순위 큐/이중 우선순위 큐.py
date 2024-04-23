import sys
import heapq

input = sys.stdin.readline
t = int(input())
for _ in range(t):
    min_heap = []
    max_heap = []
    k = int(input())
    deleted = [1] * k
    for i in range(k):
        c, n = input().split()
        n = int(n)
        
        if c == "I":
            heapq.heappush(min_heap, (n, i))
            heapq.heappush(max_heap, (-n, i))
        else:
            if n == -1:
                if min_heap:
                    deleted[heapq.heappop(min_heap)[1]] = 0
            elif n == 1:
                if max_heap:
                    deleted[heapq.heappop(max_heap)[1]] = 0
        
        while min_heap and deleted[min_heap[0][1]] == 0:
            heapq.heappop(min_heap)
        while max_heap and deleted[max_heap[0][1]] == 0:
            heapq.heappop(max_heap)
        

    if len(min_heap) == 0:
        print("EMPTY")
    else:
        print(-max_heap[0][0], min_heap[0][0])