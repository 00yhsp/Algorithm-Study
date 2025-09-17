while true {
    let arr = Array(readLine()!)
    if arr == ["0"] { break }
    let count = arr.count
    var flag = true
    for i in (0..<count / 2) {
        if arr[i] != arr[count - i - 1] { 
            flag = false
            break
        }
    }
    print(flag ? "yes" : "no")
}