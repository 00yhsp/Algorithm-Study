import Foundation

func solution(_ points:[[Int]], _ routes:[[Int]]) -> Int {
    var robots = [[Int]]()
    var nextIdx = [Int]()
    var done = [Bool]()
    var conflicts = 0

    for r in routes.indices {
        let startPt = routes[r][0] - 1
        robots.append(points[startPt])
        nextIdx.append(1)
        done.append(false)
    }

    func moveRobot(_ i: Int) {
        let dest = points[ routes[i][ nextIdx[i] ] - 1 ]
        var pos = robots[i]

        if pos[0] != dest[0] { pos[0] += dest[0] > pos[0] ? 1 : -1 }
        else if pos[1] != dest[1] { pos[1] += dest[1] > pos[1] ? 1 : -1 }
        robots[i] = pos

        if pos == dest {
            if nextIdx[i] + 1 == routes[i].count { done[i] = true }
            else { nextIdx[i] += 1 }
        }
    }

    func checkConflict() {
        var counter = [[Int]: Int]()
        for pos in robots { counter[pos, default: 0] += 1 }
        for (pos, cnt) in counter {
            if pos != [-1, -1] && cnt > 1 { conflicts += 1 }
        }
    }

    checkConflict()

    while !done.allSatisfy({ $0 }) {
        for i in robots.indices where !done[i] { moveRobot(i) }
        checkConflict()
        for i in robots.indices where done[i] { robots[i] = [-1, -1] }
    }

    return conflicts
}