import Foundation

func binarySearch(_ arr: [Int], _ target: Int) -> Int {
    if arr.count == 0 { return 0 }
    var start = 0; var end = arr.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] >= target { end = mid - 1 }
        else { start = mid + 1}
    }
    
    return start
}

func solution(_ dice:[[Int]]) -> [Int] {
    // 절반 쌍 구하기 완탐
    var halfs = [[Int]]()
    func getHalfs(_ selected: [Int], _ start: Int) {
        if selected.count == dice.count / 2 {
            halfs.append(selected)
            return
        }
        if start == dice.count { return }
        for i in start..<dice.count {
            getHalfs(selected + [i], i + 1) 
        }
    }
    getHalfs([], 0)
    
    // 선택에 대한 점수 저장
    var halfScores = [[Int]: [Int]]()
    var halfScore = [Int]()
    func getHalfScore(_ idx: Int, _ score: Int, _ start: Int) {
        if start == halfs[idx].count {
            halfScore.append(score)
            return
        }
        for i in 0..<6 {
            getHalfScore(idx, score + dice[halfs[idx][start]][i], start + 1)
        }
    }
    for i in 0..<halfs.count {
        getHalfScore(i, 0, 0) 
        halfScores[halfs[i]] = halfScore.sorted()
        halfScore.removeAll()
    }
    
    var maxWin = 0
    var maxHalf = [Int]()
    for half in halfs {
        // 쌍 만들기
        var anotherHalf = [Int]()
        let halfSet = Set(half)
        for i in 0..<dice.count {
            if !halfSet.contains(i) { anotherHalf.append(i) }
        }
        
        var start = 0; 
        
        // 승리 수 (시행회수가 같으므로 승리만 세면됨)
        
        var win = 0
        let anotherHalfScores = halfScores[anotherHalf, default: []]
        
        for myScore in halfScores[half, default: []] {
            let idx = binarySearch(anotherHalfScores, myScore)
            win += idx
        }
        
        if win > maxWin {
            maxWin = win
            maxHalf = half
        }
    }
    
    return maxHalf.map { $0 + 1 }
}