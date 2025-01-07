var input = readLine()!.split(separator: "-").map { String($0) }
var result = parse(input.removeFirst())
input.forEach { result -= parse($0) }
print(result)

func parse(_ str: String) -> Int {
    var sum = 0
    var num = 0
    for chr in str {
        if chr.isNumber {
            num = num * 10 + Int(chr.asciiValue! - 48)
        } else {
            sum += num
            num = 0
        }
    }
    sum += num
    return sum
}
