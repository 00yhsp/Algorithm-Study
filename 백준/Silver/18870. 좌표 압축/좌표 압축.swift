let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

let sorted = Array(Set(arr)).sorted()

var dict = [Int: Int]()
for (rank, value) in sorted.enumerated() {
    dict[value] = rank
}

print(arr.map { String(dict[$0]!) }.joined(separator: " "))
