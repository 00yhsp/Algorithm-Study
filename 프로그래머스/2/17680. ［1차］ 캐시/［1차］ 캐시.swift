func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return 5 * cities.count }
    
    var result = 0
    var cache = [String]()
    
    for city in cities {
        let city = city.lowercased()
        
        if let idx = cache.firstIndex(of: city) {
            cache.remove(at: idx)
            cache.append(city)
            result += 1
        } else {
            if cache.count == cacheSize { cache.removeFirst() }
            cache.append(city)
            result += 5
        }
    }
    
    return result
}
