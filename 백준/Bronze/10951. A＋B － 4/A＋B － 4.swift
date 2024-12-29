while true {
    if let input = readLine(), !input.isEmpty {
        let arr = input.split(separator: " ").map { Int($0)! }
        print(arr[0] + arr[1])
    } else {
        break
    }
}
