import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var result = [Int]()
    var people = [
        NoMathPLZ(answer: [1, 2, 3, 4, 5]),
        NoMathPLZ(answer: [2, 1, 2, 3, 2, 4, 2, 5]),
        NoMathPLZ(answer: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5])
    ]
    
    for (i, answer) in answers.enumerated() {
        if people[0].answer[i % 5] == answer { people[0].score += 1 }
        if people[1].answer[i % 8] == answer { people[1].score += 1 }
        if people[2].answer[i % 10] == answer { people[2].score += 1 }
    }
    
    
    let scores = [people[0].score, people[1].score, people[2].score]
    let max = scores.max()
    
    for i in 0...2 {
        if people[i].score == max { result.append(i + 1) }
    }
    
    return result
}

struct NoMathPLZ {
    var score = 0
    var answer: [Int]
    var pointer = 0
}