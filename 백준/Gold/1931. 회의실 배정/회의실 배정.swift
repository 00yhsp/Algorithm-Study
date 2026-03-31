let n = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<n { arr.append(readLine()!.split(separator: " ").compactMap { Int($0) }) }
arr.sort { 
    if $0[1] == $1[1] { return $0[0] < $1[0] }
    return $0[1] < $1[1]
}
let limit = arr[n - 1][1]

var count = 0
var cur = 0
for i in 0..<n where arr[i][0] >= cur {
    cur = arr[i][1]
    count += 1
}

print(count)