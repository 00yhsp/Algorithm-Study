def solution(prices):
    n = len(prices)
    answer = [0] * n  
    stack = []

    for i, price in enumerate(prices):
        while stack and prices[stack[-1]] > price: 
            idx = stack.pop()
            answer[idx] = i - idx 
        stack.append(i)
    
    while stack:
        idx = stack.pop()
        answer[idx] = (n - 1) - idx
    
    return answer