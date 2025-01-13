import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let funcs = readLine()!
    _ = readLine()!
    var input = readLine()!

    input = String(input.dropFirst().dropLast())

    var elements: [String]
    if input.isEmpty { elements = [] }
    else { elements = input.split(separator: ",").map { String($0) } }

    var front = 0
    var back = elements.count - 1

    var isReversed = false
    var isError = false

    for f in funcs {
        if f == "R" {
            isReversed.toggle()
        } else {
            if front > back {
                isError = true
                break
            }
            if isReversed { back -= 1 }
            else { front += 1 }
        }
    }

    if isError {
        print("error")
    } else if front > back {
        print("[]")
    } else {
        let subArray = elements[front...back]
        if isReversed { print("[" + subArray.reversed().joined(separator: ",") + "]") }
        else { print("[" + subArray.joined(separator: ",") + "]") }
    }
}
