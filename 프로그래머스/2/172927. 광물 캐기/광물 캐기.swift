import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    let table: [[Int]] = [
        [1, 1, 1],
        [5, 1, 1],
        [25, 5, 1]
    ]
    let totalGroups = (minerals.count + 4) / 5
    var groups = [[Int]]()
    for i in 0..<totalGroups {
        let start = i * 5
        let end = min(start + 5, minerals.count)
        let slice = minerals[start..<end]
        var group = [
            slice.filter { $0 == "diamond" }.count, 
            slice.filter { $0 == "iron" }.count, 
            slice.filter { $0 == "stone" }.count
        ]
        groups.append(group)
    }

    var answer = Int.max
    var picks = picks

    func dfs(_ idx: Int, _ currentFatigue: Int) {
        if currentFatigue >= answer { return }
        if idx == totalGroups || (picks[0] == 0 && picks[1] == 0 && picks[2] == 0) {
            answer = min(answer, currentFatigue)
            return
        }

        for t in 0..<3 {
            guard picks[t] > 0 else { continue }
            let group = groups[idx]
            let cost = group[0] * table[t][0] + group[1] * table[t][1] + group[2] * table[t][2]

            picks[t] -= 1
            dfs(idx + 1, currentFatigue + cost)
            picks[t] += 1
        }
    }

    dfs(0, 0)
    return answer
}