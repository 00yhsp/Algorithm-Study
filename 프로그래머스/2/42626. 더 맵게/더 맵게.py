import heapq

def solution(scoville, K):
    scoville.sort()
    heapq.heapify(scoville)
    result = 0
    while len(scoville) > 1:
        first = heapq.heappop(scoville)
        second = heapq.heappop(scoville)
        if first >= K and second >= K:
            return result
        heapq.heappush(scoville, first + second * 2)
        result += 1
    if scoville[0] > K:
        return result
    else:
        return -1