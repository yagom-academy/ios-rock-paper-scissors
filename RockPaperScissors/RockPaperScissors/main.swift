//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissors: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}

func compareRockPaperScissors(between randomRockPaperScissors: RockPaperScissors, and playerRockPaperScissors: RockPaperScissors) -> String {
    if randomRockPaperScissors == playerRockPaperScissors {
        return "비겼습니다!"
    }
    
    switch playerRockPaperScissors {
    case .scissor:
        return randomRockPaperScissors == RockPaperScissors.paper ? "이겼습니다!" : "졌습니다!"
    case .rock:
        return randomRockPaperScissors == RockPaperScissors.scissor ? "이겼습니다!" : "졌습니다!"
    case .paper:
        return randomRockPaperScissors == RockPaperScissors.rock ? "이겼습니다!" : "졌습니다!"
    }
}


func getRockPaperScissors() {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        if let input = readLine(), let choice = Int(input) {
            if choice == 0 {
                print("게임 종료")
                break
            } else if choice < 1 || choice > 3 {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
        }
    }
}
