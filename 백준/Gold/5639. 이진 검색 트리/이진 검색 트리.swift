var nodes = [Int]()
while let input = readLine() { nodes.append(Int(input)!) }

postOrder(0, nodes.count)

func findRightIndex(_ start: Int, _ end: Int) -> Int {
    var higherIndex = end

    for i in start ..< end {
        if nodes[i] > nodes[start - 1] {
            higherIndex = i
            break
        }
    }

    return higherIndex
}

func postOrder(_ start: Int, _ end: Int) {
    if start >= end { return }

    let rightIndex = findRightIndex(start + 1, end)

    postOrder(start + 1, rightIndex)
    postOrder(rightIndex, end)
    print(nodes[start])
}
