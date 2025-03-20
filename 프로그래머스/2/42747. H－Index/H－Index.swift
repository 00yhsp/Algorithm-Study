import Foundation

func solution(_ citations: [Int]) -> Int {
    let citations = citations.sorted(by: >)
    
    for (index, citation) in citations.enumerated() {
        if citation < index + 1 { return index }
    }
    return citations.count
}