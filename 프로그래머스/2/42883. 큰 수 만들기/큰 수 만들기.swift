import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var result = [Character]()
    var remaining = k

    for digit in number {
        while remaining > 0,
              let last = result.last,
              last < digit {
            result.removeLast()
            remaining -= 1
        }

        result.append(digit)
    }

    if remaining > 0 {
        result.removeLast(remaining)
    }
    
    return String(result)
}