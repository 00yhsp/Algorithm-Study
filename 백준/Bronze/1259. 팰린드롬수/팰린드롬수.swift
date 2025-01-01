while true {
    let str = Array(readLine()!)
    if str == ["0"] { break }
    var flag = true
    for i in 0..<str.count / 2 {
        if str[i] != str[str.count - i - 1] {
            flag = false
            break
        }
    }
    if flag {
        print("yes")
    } else {
        print("no")
    }
}
