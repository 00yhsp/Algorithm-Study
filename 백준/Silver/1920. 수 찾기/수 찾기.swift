let n = Int(readLine()!)!
let set = Set(readLine()!.split(separator: " ").map { Int($0)! })

let m = Int(readLine()!)
let arr = readLine()!.split(separator: " ").map { Int($0)! }

for elem in arr {
    set.contains(elem) ? print("1") : print("0")
}
