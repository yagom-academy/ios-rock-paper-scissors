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
    case scissors = 1
    case rock
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
        if isGameEnd(userNumber: userNumber) {
            print("게임 종료")
            return
        }
        let userScenario = checkRockScissorsPaperResult(userNumber: userNumber, with: computerChoice)
        playMukjippa(userScenario: userScenario)
    case .failure(_):
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func playMukjippa(userScenario: RockScissorsPaperScenario) {
    printMukjippa(userScenario: userScenario)
}

func printMukjippa(userScenario: RockScissorsPaperScenario) {
    if userScenario == .userWin {
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
    } else if userScenario == .userLose {
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
    }
}

func isGameEnd(userNumber: Int) -> Bool {
    return userNumber == 0 ? true : false
}

while !endFlag {
    playRockScissorsPaper()
}
