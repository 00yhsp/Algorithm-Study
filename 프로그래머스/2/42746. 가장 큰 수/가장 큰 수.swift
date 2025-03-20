func solution(_ numbers: [Int]) -> String {
    let strNumbers = numbers.map { String($0) }
    let sortedNumbers = strNumbers.sorted { $0 + $1 > $1 + $0 }
    if sortedNumbers.first == "0" { return "0" }
    return sortedNumbers.joined(separator: "")
}