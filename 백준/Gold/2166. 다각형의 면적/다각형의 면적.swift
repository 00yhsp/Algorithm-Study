import Foundation

let n = Int(readLine()!)!
var coords = [(Double, Double)]()
var result: Double = 0

for _ in 0..<n {
    let coord = readLine()!.split(separator: " ").compactMap { Double($0) }
    coords.append((coord[0], coord[1]))
}
coords.append(coords.first!)

for i in 0..<n {
    result += coords[i].0 * coords[i + 1].1 - coords[i].1 * coords[i + 1].0
}

print(round(abs(result * 5)) / 10)
