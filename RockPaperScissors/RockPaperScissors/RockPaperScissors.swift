//  Created by 감자 and som on 2022/08/22.

enum RockPaperScissors: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    static func random() -> RockPaperScissors {
        let rps: [Self] = [.scissors, .rock, .paper]
        let randomNumber = Int.random(in: 0...2)
        return rps[randomNumber]
    }
}
