var size = 64
var remaining = Int(readLine()!)!
var count = 0
while remaining > 0 {
    if size <= remaining {
        remaining -= size
        count += 1
    }
    size /= 2
}
print(count)