func solution(_ tickets: [[String]]) -> [String] {
    let ticketCount = tickets.count
    var tickets = tickets.sorted {
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] < $1[0]
    }
    
    var visited = [Bool](repeating: false, count: ticketCount)
    var answer = [String]()
    
    func dfs(_ airport: String, _ route: [String]) {
        if !answer.isEmpty { return }
        if route.count == ticketCount + 1 {
            answer = route
            return
        }
        for i in 0..<ticketCount {
            if !visited[i] && tickets[i][0] == airport {
                visited[i] = true
                dfs(tickets[i][1], route + [tickets[i][1]])
                visited[i] = false
            }
        }
    }
    
    dfs("ICN", ["ICN"])
    return answer
}