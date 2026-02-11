var arr = readLine()!.map(String.init)
let remainder = Int(arr.removeLast())!
var val = 0
var index = 0
for (idx, elem) in arr.enumerated() {
    if let elem = Int(elem) { 
        if idx % 2 == 0 { val += elem }
        else { val += elem * 3 }
    } else { 
        index = idx 
    }
}
let weight = index % 2 == 0 ? 1 : 3

for i in 0...9 {
    if (val + (i * weight) + remainder) % 10 == 0 {
        print(i)
    }
}