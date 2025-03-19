def solution(participant, completion):
    pt_dict = {}
    for pt in participant:
        if pt in pt_dict:
            pt_dict[pt] += 1
        else:
            pt_dict[pt] = 1
    for cmp in completion:
        if cmp in pt_dict:
            if pt_dict[cmp] == 1:
                del pt_dict[cmp]
            else:
                pt_dict[cmp] -= 1
    for k in pt_dict:
        return k
    