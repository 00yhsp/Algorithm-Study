var arr = [String]()

for _ in 0...2 { arr.append(readLine()!) }

if arr[0] != "Fizz" && arr[0] != "Buzz" && arr[0] != "FizzBuzz" {
    printFizzBuzz(Int(arr[0])! + 3)
} else if arr[1] != "Fizz" && arr[1] != "Buzz" && arr[1] != "FizzBuzz" {
    printFizzBuzz(Int(arr[1])! + 2)
} else {
    printFizzBuzz(Int(arr[2])! + 1)
}

func printFizzBuzz(_ n: Int) {
    if n % 15 == 0 {
        print("FizzBuzz")
    } else if n % 5 == 0 {
        print("Buzz")
    } else if n % 3 == 0 {
        print("Fizz")
    } else {
        print(n)
    }
}
