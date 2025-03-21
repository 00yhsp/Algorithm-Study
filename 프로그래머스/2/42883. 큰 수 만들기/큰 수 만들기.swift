func solution(_ number: String, _ k: Int) -> String {
    var k = k
    var stack = [Character]()
    
    for n in number {
        while k > 0, !stack.isEmpty, stack.last! < n {
            k -= 1
            stack.removeLast()
        }
        stack.append(n)
    }
    
    if k > 0 { stack.removeLast(k) }
    
    return String(stack)
}