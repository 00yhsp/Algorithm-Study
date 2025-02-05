var nodes = [Int]()
while let input = readLine() { nodes.append(Int(input)!) }

postOrder(0, nodes.count)

func findRightIndex(_ start: Int, _ end: Int) -> Int {
    let key = nodes[start - 1]
    var start = start, end = end
    while start < end {
        let mid = (start + end) / 2
        if nodes[mid] < key {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return start
}

func postOrder(_ start: Int, _ end: Int) {
    if start >= end { return }

    let rightIndex = findRightIndex(start + 1, end)

    postOrder(start + 1, rightIndex)
    postOrder(rightIndex, end)
    print(nodes[start])
}
