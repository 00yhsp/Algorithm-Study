let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0

for i in 0..<arr.count {
    for j in i + 1..<arr.count {
        for k in j + 1..<arr.count {
            let sum = arr[i] + arr[j] + arr[k]
            if result < sum && sum <= m {
                result = sum
            }
        }
    }
}

print(result)
