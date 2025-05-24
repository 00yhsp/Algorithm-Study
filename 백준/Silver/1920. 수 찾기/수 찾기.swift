let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
let _ = readLine()
let targets = readLine()!.split(separator: " ").compactMap { Int($0) }

var output = [String]()
targets.forEach { output.append(binarySearch($0)) }
print(output.joined(), terminator: "")

func binarySearch(_ x: Int) -> String {
    var start = 0
    var end = n - 1

    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] < x { start = mid + 1 }
        else { end = mid - 1 }
        if arr[mid] == x { return "1\n" }
    }
    
    return "0\n"
}