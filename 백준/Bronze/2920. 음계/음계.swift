let arr = readLine()!.split(separator: " ").map { Int($0)! }

var isAsc = true
var isDesc = true

for i in 0..<arr.count - 1 {
    if arr[i] < arr[i + 1] { isDesc = false }
    else { isAsc = false }
}

if isAsc { print("ascending") }
else if isDesc { print("descending") }
else { print("mixed") }
