import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var horizontals = [Int]()
    var verticals = [Int]()
    
    for size in sizes {
        if size[0] > size[1] {
            horizontals.append(size[0])
            verticals.append(size[1])
        } else {
            horizontals.append(size[1])
            verticals.append(size[0])
        }
    }
    
    return horizontals.max()! * verticals.max()!
}