func solution(_ numbers: [Int]) -> String {
    let sortedNumbers = numbers.map(String.init)
                                .sorted { $0 + $1 > $1 + $0 }
                                .joined(separator: "")
    return sortedNumbers.first == "0" ? "0" : sortedNumbers
}