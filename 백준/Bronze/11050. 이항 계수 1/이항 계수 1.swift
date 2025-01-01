let arr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (arr[0], arr[1])

if n == k || k == 0 {
    print(1)
} else {
    let son = (n - k + 1...n).reduce(1, *)
    let mom = (1...k).reduce(1, *)

    print(son / mom)
}
