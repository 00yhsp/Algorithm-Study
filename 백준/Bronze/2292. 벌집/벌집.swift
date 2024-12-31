let n = Int(readLine()!)!

var i = 1

while true {
    if sum(i) >= n {
        print(i)
        break
    }
    i += 1
}


func sum(_ n: Int) -> Int {
    6 * (n - 1) * n / 2 + 1
}
