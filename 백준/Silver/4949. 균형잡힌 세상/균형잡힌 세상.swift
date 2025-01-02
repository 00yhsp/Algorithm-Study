while let str = readLine(), str != "." {
    var stack = Stack<Character>()
    var isBalanced = true

    for elem in str {
        switch elem {
        case "(", "[":
            stack.push(elem)
        case ")":
            if stack.pop() != "(" {
                isBalanced = false
                break
            }
        case "]":
            if stack.pop() != "[" {
                isBalanced = false
                break
            }
        default:
            continue
        }
    }

    if !stack.isEmpty { isBalanced = false }

    print(isBalanced ? "yes" : "no")
}

struct Stack<T> {
    private var _stack = [T]()
    var isEmpty: Bool { _stack.isEmpty }
    mutating func push(_ element: T) { _stack.append(element) }
    mutating func pop() -> T? { _stack.popLast() }
}
