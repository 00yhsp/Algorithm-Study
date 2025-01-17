let n = Int(readLine()!)!
var tree = [String: [String]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    tree[input[0]] = [input[1], input[2]]
}

preorder("A")
print()
inorder("A")
print()
postorder("A")
print()

func preorder(_ node: String) {
    print(node, terminator: "")
    if tree[node]![0] != "." {
        preorder(tree[node]![0])
    }
    if tree[node]![1] != "." {
        preorder(tree[node]![1])
    }
}

func inorder(_ node: String) {
    if tree[node]![0] != "." {
        inorder(tree[node]![0])
    }
    print(node, terminator: "")
    if tree[node]![1] != "." {
        inorder(tree[node]![1])
    }
}

func postorder(_ node: String) {
    if tree[node]![0] != "." {
        postorder(tree[node]![0])
    }
    if tree[node]![1] != "." {
        postorder(tree[node]![1])
    }
    print(node, terminator: "")
}
