let n = Int(readLine()!)!

var stack = Stack<Int>()

for _ in 1...n {
    let input = readLine()!.split(separator: " ")
    switch input[0] {
    case "push":
        stack.push(Int(input[1])!)
    case "pop":
        if let popped = stack.pop() { print(popped) }
        else { print(-1) }
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    case "top":
        if let last = stack.last { print(last) }
        else { print(-1) }
    default:
        break
    }
}

struct Stack<T> {
    private var _stack = [T]()
    var isEmpty: Bool { _stack.isEmpty }
    var count: Int { _stack.count }
    var last: T? { _stack.last }
    mutating func push(_ element: T) { _stack.append(element) }
    mutating func pop() -> T? { _stack.popLast() }
}
