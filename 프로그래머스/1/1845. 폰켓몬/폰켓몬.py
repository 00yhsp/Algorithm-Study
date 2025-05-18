def solution(nums):
    numDict = {}
    selectDict = {}
    idx = 0
    count = 0
    for num in nums:
        if num not in numDict:
            numDict[num] = 1
        else:
            numDict[num] += 1
    while True:
        keys = numDict.keys()
        for key in keys:
            numDict[key] -= 1
            if key not in selectDict:
                selectDict[key] = 1
            else:
                selectDict[key] += 1
            count += 1
            if count == len(nums) // 2:
                return len(selectDict)