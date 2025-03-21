import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let right = (brown - 4) / 2
    let (yR, yC) = findYellowPairs(yellow, right)
    return [yR + 2, yC + 2]
}

func findYellowPairs(_ yellow: Int, _ right: Int) -> (Int, Int) {
    let root = Int(sqrt(Double(yellow)))
    let limit = max(root, 1)
    for i in (1...limit) {
        if yellow % i == 0 && i * (right - i) == yellow {
            return (max(i, (right - i)), min(i, (right - i)))
        }
    }
    return (0, 0)
}

// yellow -> yr * yc
// brown -> (yr + 2) * (yc + 2) - yr * yc == 2(yr + yc) + 4

// 2(yr + yc) + 4 = brown
// yr + yc = brown - 4 / 2
// yr + yc를 구하면 yr + 1과 yc + 1중 더 큰게 가로, 작은게 세로

// 