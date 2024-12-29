let str = readLine()!

var count = 1

for elem in str {
    if elem == " " { count += 1 }
}

if str.first! == " " { count -= 1 }
if str.last! == " " { count -= 1 }

print(count)
