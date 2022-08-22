//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct GameManager {
    var players: [Player]
    
    init(_ players: Player...) {
        self.players = players
    }
        
    func recieveHandShapeFromUser() -> HandShape? {
        while true {
            printRockPaperScissorsManual()
            let userInput = recieveInputFromUser()
            guard let convertedInput = Int(userInput) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            switch convertedInput {
            case 1:
                return HandShape.rock
            case 2:
                return HandShape.paper
            case 3:
                return HandShape.scissors
            case 0:
                return nil
            default :
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
    
    func printRockPaperScissorsManual() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func recieveInputFromUser() -> String {
        guard let input = readLine() else { return "" }
        return input
    }
}
