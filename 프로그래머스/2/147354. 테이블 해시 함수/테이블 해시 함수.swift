import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {

    var data = data.sorted {
        if $0[col - 1] == $1[col - 1] {
            return $0[0] > $1[0]
        } else {
            return $0[col - 1] < $1[col - 1]
        }
    }
    
    var si = (1...data.count).map { i in
        data[i - 1].reduce(0) { $0 + $1 % i }
    }
    
    var hashValue = si[row_begin - 1]
    if row_begin == row_end { return hashValue }
    for i in row_begin...row_end - 1 { hashValue ^= si[i] }
    
    return hashValue
}