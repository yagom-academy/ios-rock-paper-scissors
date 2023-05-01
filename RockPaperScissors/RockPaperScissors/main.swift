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

func getUserInput() -> Bool {
    var isUserSelect: Bool = true
    
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    guard let input = readLine() else { return isUserSelect }

    switch input {
    case "1", "2", "3":
        guard let inputNumber = Int(input) else { return isUserSelect }
        guard let playerRockPaperScissors = RockPaperScissors(rawValue: inputNumber) else { return isUserSelect }
        guard let randomRockPaperScissors = RockPaperScissors(rawValue: Int.random(in: 1...3)) else { return isUserSelect }
        print(compareRockPaperScissors(between: randomRockPaperScissors, and: playerRockPaperScissors))
    case "0":
        isUserSelect = false
        print("게임 종료")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    return isUserSelect
}

func startGame() {
    var isUserSelect: Bool = true
    
    repeat {
        isUserSelect = getUserInput()
    } while isUserSelect
}

startGame()
