import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted { $0[1] < $1[1] }
    var coord = -1.0
    var count = 0
    
    for target in targets {
        let s = Double(target[0])
        let e = Double(target[1])
        
        if !(s < coord && coord < e) {
            count += 1
            coord = e - 0.5
        }
    }
    
    return count
}
// 미사일 최소 사용 모든 폭격 미사일 요격

// 폭격 미사일
// A나라의 폭격 미사일
//  x축에 평행한 직선 형태의 모양이며, 개구간을 나타내는 정수 쌍 (s, e)
// B나라의 요격 미사일
//  특정 x좌표에서 y축에 수평이 되도록 발사
//  해당 x좌표의 미사일을 관통하여 한번에 요격
//  s, e에선 요격 불가능
//  실수 좌표에서 발사 가능

// e - 0.5 기준 조사