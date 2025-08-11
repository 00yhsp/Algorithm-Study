import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    func euclidianDistanceSquare(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
        let dx = x1 - x2
        let dy = y1 - y2
        return dx*dx + dy*dy
    }
    
    var answer = [Int]()
    
    for ball in balls {
        let a = ball[0]
        let b = ball[1]
        var best = Int.max

        if !(startY == b && startX > a) {
            best = min(best, euclidianDistanceSquare(startX, startY, -a, b))
        }

        if !(startY == b && startX < a) {
            best = min(best, euclidianDistanceSquare(startX, startY, 2 * m - a, b))
        }

        if !(startX == a && startY > b) {
            best = min(best, euclidianDistanceSquare(startX, startY, a, -b))
        }

        if !(startX == a && startY < b) {
            best = min(best, euclidianDistanceSquare(startX, startY, a, 2 * n - b))
        }

        answer.append(best)
    }
    
    return answer
}