var arr = [(Int, Int)]()

for i in 1...9 {
    arr.append( (Int(readLine()!)!, i) )
}

let max = arr.max { $0.0 < $1.0 }!

print(max.0)
print(max.1)
