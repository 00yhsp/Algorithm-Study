let n = Int(readLine()!)!

for _ in 1...n {
    let str = readLine()!
    var stack = Stack<Character>()
    var isVPS = true
    for chr in str {
        if chr == "(" {
            stack.push(chr)
        } else {
            if stack.pop() == nil { isVPS = false }
        }
    }
    if stack.isEmpty && isVPS {
        print("YES")
    } else {
        print("NO")
    }
}

struct Stack<T> {
    private var _stack = [T]()
    var isEmpty: Bool { _stack.isEmpty }
    var count: Int { _stack.count }
    mutating func push(_ element: T) { _stack.append(element) }
    mutating func pop() -> T? { _stack.popLast() }
}
