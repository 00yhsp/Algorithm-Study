let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var visited = Array(repeating: false, count: n)
var result = [Int]()

backtrack(0)

func backtrack(_ start: Int) {
    if result.count == m {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            result.append(arr[i])
            backtrack(i + 1)
            _ = result.popLast()
            visited[i] = false
        }
    }
}
