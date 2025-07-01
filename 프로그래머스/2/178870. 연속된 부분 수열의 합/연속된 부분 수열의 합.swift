import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    let count = sequence.count
    var start = 0
    var currentSum = 0
    
    var minLength = count + 1
    var result = [0, 0]

    for end in 0..<count {
        currentSum += sequence[end]
        
        while currentSum > k && start <= end {
            currentSum -= sequence[start]
            start += 1
        }
        
        if currentSum == k {
            let currentLength = end - start
            
            if currentLength < minLength {
                minLength = currentLength
                result = [start, end]
            }
        }
    }
    
    return result
}