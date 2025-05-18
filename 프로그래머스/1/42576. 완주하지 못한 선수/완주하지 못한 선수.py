def solution(participant, completion):
    completed = {}
    participated = {}
    for part in participant:
        if part in participated:
            participated[part] += 1
        else:
            participated[part] = 1
    for comp in completion:
        if comp in completed:
            completed[comp] += 1
        else:
            completed[comp] = 1
    for part in participant:
        if part not in completed:
            return part
        if participated[part] != completed[part]:
            return part