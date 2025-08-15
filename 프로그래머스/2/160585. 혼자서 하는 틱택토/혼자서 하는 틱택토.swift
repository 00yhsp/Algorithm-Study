import Foundation

func solution(_ board:[String]) -> Int {
    let board = board.map { Array($0) }
    
    let oCount = board.reduce(0) { $0 + $1.filter { $0 == "O" }.count }
    let xCount = board.reduce(0) { $0 + $1.filter { $0 == "X" }.count }
    
    if xCount > oCount || oCount > xCount + 1 { return 0 }
    if hasWon(board, player: "O") { if oCount == xCount { return 0 } }
    if hasWon(board, player: "X") { if oCount > xCount { return 0 } }
    
    return 1
}

func hasWon(_ board: [[Character]], player: Character) -> Bool {   
    for i in 0..<3 {
        if board[i][0] == player && board[i][1] == player && board[i][2] == player {
            return true
        }
    }
    
    for j in 0..<3 {
        if board[0][j] == player && board[1][j] == player && board[2][j] == player {
            return true
        }
    }
    
    if board[0][0] == player && board[1][1] == player && board[2][2] == player {
        return true
    }
    if board[0][2] == player && board[1][1] == player && board[2][0] == player {
        return true
    }
    
    return false
}