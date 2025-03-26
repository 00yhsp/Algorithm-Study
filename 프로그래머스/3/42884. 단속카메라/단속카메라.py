def solution(routes):
    routes.sort(key=lambda x: x[1])
    
    camera_pos = -30001
    count = 0
    
    for route in routes:
        if route[0] > camera_pos:
            camera_pos = route[1]
            count += 1
            
    return count