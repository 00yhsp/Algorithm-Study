def solution(new_id):
    answer = ""
    for chr in new_id.lower():
        if chr.isdigit() or chr.islower() or chr in '_.-':
            answer += chr
    while '..' in answer:
        answer = answer.replace('..', '.')
    if answer.startswith('.'):
        answer = answer[1:]
    if answer.endswith('.'):
        answer = answer[:-1]
    if len(answer) == 0:
        answer = "a"
    if len(answer) >= 16:
        answer = answer[:15]
        if answer[-1] == '.':
            answer = answer[:-1]
    while len(answer) <= 2:
        answer += answer[-1]
    
    return answer