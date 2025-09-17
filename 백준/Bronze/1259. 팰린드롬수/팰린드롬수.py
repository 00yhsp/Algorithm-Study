while True:
    arr = input()
    count = len(arr)
    if arr == "0":
        break
    flag = True
    for i in range(0, count // 2):
        if arr[i] != arr[count - i - 1]:
            flag = False
            break
    print("yes" if flag else "no")