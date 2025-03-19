import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var summaries = [String: Int]()
    var infos = [String: [(play: Int, id: Int)]]()
    var bestAlbum = [Int]()
                 
    let length = genres.count
    for idx in 0..<length {
        summaries[genres[idx], default: 0] += plays[idx]
        infos[genres[idx], default: []].append((play: plays[idx], id: idx))
    }
    
    let priority = summaries.keys.sorted { summaries[$0]! > summaries[$1]! }
    for key in priority {
        let sortedInfos = infos[key, default: []].sorted { 
            if $0.play == $1.play {
                return $0.id < $1.id
            }
            return $0.play > $1.play
        }
        bestAlbum.append(sortedInfos[0].id)
        if sortedInfos.count > 1 { bestAlbum.append(sortedInfos[1].id) }
    }
    
    return bestAlbum
}