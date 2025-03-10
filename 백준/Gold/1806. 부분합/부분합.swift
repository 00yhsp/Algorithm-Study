let ns = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, s) = (ns[0], ns[1])

let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
find()

func find() {
    var start = 0
    var end = 0
    var result = Int.max
    var ps = 0
    
    while end != n || ps >= s {
        if ps >= s {
            result = min(result, end - start)
            ps -= arr[start]
            start += 1
        } else {
            ps += arr[end]
            end += 1
        }
    }
    
    print(result == Int.max ? 0 : result)
}