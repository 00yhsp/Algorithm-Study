let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = Int(readLine()!)!
var b = readLine()!.split(separator: " ").compactMap { Int($0) }

findCommonSubsequence()

func findCommonSubsequence() {
    var commonSubsequence = [Int]()

    while true {
        let (commonBiggest, aIdx, bIdx) = findCommonBiggest()
        if commonBiggest == -1 { break }
        commonSubsequence.append(commonBiggest)

        a = Array(a[aIdx + 1..<a.count])
        b = Array(b[bIdx + 1..<b.count])
    }

    if commonSubsequence.isEmpty {
        print(0)
    } else {
        print(commonSubsequence.count)
        print(commonSubsequence.compactMap { String($0) }.joined(separator: " "))
    }
}

func findCommonBiggest() -> (Int, Int, Int) {
    var aSet = Set<Int>()
    var bSet = Set<Int>()
    var result = -1

    a.forEach { aSet.insert($0) }
    b.forEach { bSet.insert($0) }

    for i in 1...100 {
        if aSet.contains(i) && bSet.contains(i) { result = i }
    }
    return (result, a.firstIndex(of: result) ?? 0, b.firstIndex(of: result) ?? 0)
}
