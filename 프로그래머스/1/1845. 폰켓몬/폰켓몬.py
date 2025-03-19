def solution(nums):
    dic = {}
    result_dic = {}
    for num in nums:
        if num in dic:
            dic[num] = dic[num] + 1
        else:
            dic[num] = 1
    count = 0
    answer = 0
    length = len(dic)
    while True:
        for i in dic:
            if i in result_dic:
                result_dic[i] = result_dic[i] + 1
            else:
                result_dic[i] = 1
                answer += 1
            count += 1
            if count == len(nums) // 2: 
                return answer 
            
    return 0