let str = readLine()!
var dict = [Character: Int]()

for (i, chr) in str.enumerated() {
    if let idx = dict[chr] {
        if idx > i { dict[chr] = i }
    } else {
        dict[chr] = i
    }
}

for ascii in 97...122 {
    let chr = Character(Unicode.Scalar(ascii)!)
    if let idx = dict[chr] {
        print(idx, terminator: "")
    } else {
        print(-1, terminator: "")
    }

    if ascii != 122 {
        print(" ", terminator: "")
    } else {
        print()
    }
}
