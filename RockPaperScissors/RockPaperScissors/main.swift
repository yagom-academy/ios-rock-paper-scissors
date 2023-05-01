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


func getUserInput() {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        guard let input = readLine() else { return }
     
        switch input {
        case "1", "2", "3":
            guard let inputNumber = Int(input) else { return }
            guard let playerRockPaperScissors = RockPaperScissors(rawValue: inputNumber) else { return }
            playingGame(playerRockPaperScissors)
        case "0":
            break
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
    }
}

func playingGame(_ playerInput: RockPaperScissors) {
    guard let randomRockPaperScissors = RockPaperScissors(rawValue: Int.random(in: 1...3)) else { return }
    
    compareRockPaperScissors(between: randomRockPaperScissors, and: playerInput)
}

getUserInput()


