let arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }
print(Double(arr[0]) / Double(arr[1]))