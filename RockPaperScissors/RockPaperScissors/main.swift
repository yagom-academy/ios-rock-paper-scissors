//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum RockScissorsPaperError: Error {
    case invalidRockScissorsPaper
    case invalidMukjippa
}

enum RockScissorsPaperType: Int {
    case rock = 1
    case scissors
    case paper
}

enum RockScissorsPaperScenario {
    case userWin
    case userLose
    case draw
}

var endFlag = false

func printRockScissorsPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}

func createRandomRockScissorsPaper() -> RockScissorsPaperType {
    let choice = RockScissorsPaperType(rawValue: Int.random(in: 1...3))
    guard let randomChoice = choice else {
        return createRandomRockScissorsPaper()
    }
    return randomChoice
}

func playRockScissorsPaper() {
    
    let computerChoice = createRandomRockScissorsPaper()
    printRockScissorsPaper()
    
    let rockScissorsPaperResult = choiceRockScissorsPaper()
    switch rockScissorsPaperResult {
    case .success(let userNumber):
        checkGameResult(userNumber: userNumber, with: computerChoice)
    case .failure(_):
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

while !endFlag {
    playRockScissorsPaper()
}
