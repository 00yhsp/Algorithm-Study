let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var arr = [[Int]]()
var houses = [(Int, Int)]()
var chickens = [(Int, Int)]()

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(row)
    for j in 0..<n {
        if row[j] == 1 { houses.append((i, j)) }
        else if row[j] == 2 { chickens.append((i, j)) }
    }
}

var minDistance = Int.max
var visited = Array(repeating: false, count: chickens.count)

backtrack(0, 0)
print(minDistance)

func backtrack(_ start: Int, _ count: Int) {
    if count == m {
        var totalDistance = 0

        for house in houses {
            var houseMinDistance = Int.max
            for i in 0..<chickens.count {
                if visited[i] {
                    houseMinDistance = min(houseMinDistance, abs(house.0 - chickens[i].0) + abs(house.1 - chickens[i].1))
                }
            }
            totalDistance += houseMinDistance
        }

        minDistance = min(minDistance, totalDistance)
        return
    }

    for i in start..<chickens.count {
        if !visited[i] {
            visited[i] = true
            backtrack(i + 1, count + 1)
            visited[i] = false
        }
    }
}
