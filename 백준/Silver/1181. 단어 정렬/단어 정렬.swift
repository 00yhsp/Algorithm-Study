let n = Int(readLine()!)!

var arr = [String]()

for _ in 0..<n { arr.append(readLine()!) }

arr = Array(Set(arr))

arr.sort {
    if $0.count != $1.count { return $0.count < $1.count }
    return $0 < $1
}

for elem in arr { print(elem) }
