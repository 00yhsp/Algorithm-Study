import Foundation

func solution(_ plans:[[String]]) -> [String] {
    
    var parsedPlans = plans.map { plan -> (name: String, start: Int, playtime: Int) in
        let timeComponents = plan[1].split(separator: ":").map { Int($0)! }
        let startMinutes = timeComponents[0] * 60 + timeComponents[1]
        return (name: plan[0], start: startMinutes, playtime: Int(plan[2])!)
    }.sorted { $0.start < $1.start }

    var finishedTasks = [String]()
    var pausedTasks = [(name: String, remainingTime: Int)]()
    
    var currentTime = parsedPlans.first?.start ?? 0

    for i in 0..<parsedPlans.count {
        let currentPlan = parsedPlans[i]
        
        var freeTime = currentPlan.start - currentTime
        
        while freeTime > 0 && !pausedTasks.isEmpty {
            var paused = pausedTasks.removeLast()
            
            if paused.remainingTime <= freeTime {
                finishedTasks.append(paused.name)
                currentTime += paused.remainingTime
                freeTime -= paused.remainingTime
            } else {
                paused.remainingTime -= freeTime
                pausedTasks.append(paused)
                currentTime += freeTime
                freeTime = 0
            }
        }
        
        currentTime = currentPlan.start
        pausedTasks.append((name: currentPlan.name, remainingTime: currentPlan.playtime))
    }
    
    while let lastPaused = pausedTasks.popLast() {
        finishedTasks.append(lastPaused.name)
    }

    return finishedTasks
}
