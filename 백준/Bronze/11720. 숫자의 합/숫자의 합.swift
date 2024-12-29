let _ = readLine()

let arr = readLine()!.map { Int(String($0))! }

print(arr.reduce(0, +))
