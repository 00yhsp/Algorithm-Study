while true {
    var arr = readLine()!.split(separator: " ").compactMap { Int($0) }
    if arr[0] == 0 && arr[1] == 0 && arr[2] == 0 { break }

    arr.sort(by: <)
    if arr[0] * arr[0] + arr[1] * arr[1] == arr[2] * arr[2] { print("right") }
    else { print("wrong") }
}