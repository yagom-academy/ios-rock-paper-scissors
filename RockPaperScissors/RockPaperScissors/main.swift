//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum RockScissorsPaperError: Error {
    case invalidRockScissorsPaper
    case invalidMukjippa
}

enum RockScissorsPaperType: Int, CaseIterable {
    case rock = 1
    case scissors
    case paper
}

enum RockScissorsPaperScenario {
    case userWin
    case userLose
    case draw
}

var computerChoice: RockScissorsPaperType?
var endFlag = false

func createRandomRockScissorsPaper() -> RockScissorsPaperType? {
    let choice = RockScissorsPaperType(rawValue: Int.random(in: 1...3))
    guard let randomChoice = choice else {
        return nil
    }
    return randomChoice
}

func printRockScissorsPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}

func choiceRockScissorsPaper() -> Result<Int, RockScissorsPaperError> {
    let input: String? = readLine()
    guard let choice = input else {
        return .failure(RockScissorsPaperError.invalidRockScissorsPaper)
    }
    
    guard let userChoice = Int(choice), (0...3) ~= userChoice else {
        return .failure(RockScissorsPaperError.invalidRockScissorsPaper)
    }
    
    return .success(userChoice)
}

func compare(userChoice: RockScissorsPaperType?, with computerChoice: RockScissorsPaperType?) -> RockScissorsPaperScenario {
    if userChoice == computerChoice {
        return .draw
    }
    return isUserWin(userChoice: userChoice, with: computerChoice) ? .userWin : .userLose
}

func isUserWin(userChoice: RockScissorsPaperType?, with computerChoice: RockScissorsPaperType?) -> Bool {
    if (userChoice == .rock && computerChoice == .scissors) ||
        (userChoice == .paper && computerChoice == .rock) ||
        (userChoice == .scissors && computerChoice == .paper) {
        return true
    }
    return false
}

func printResult(_ scenario: RockScissorsPaperScenario) {
    switch scenario {
    case .userWin:
        print("이겼습니다.")
    case .userLose:
        print("졌습니다.")
    case .draw:
        print("비겼습니다.")
    }
}

func playRockScissorsPaper() {
    computerChoice = createRandomRockScissorsPaper()
    printRockScissorsPaper()
    let rockScissorsPaperResult = choiceRockScissorsPaper()
    switch rockScissorsPaperResult {
    case .success(let userChoice):
        checkGameResult(userChoice: userChoice, with: computerChoice)
    case .failure(_):
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func checkGameResult(userChoice: Int, with computerChoice: RockScissorsPaperType?) {
    guard userChoice != 0 else {
        print("게임 종료")
        endFlag = true
        return
    }
    let userScenario = compare(userChoice: RockScissorsPaperType(rawValue: userChoice), with: computerChoice)
    printResult(userScenario)
    if (userScenario == .userWin) || (userScenario == .userLose) {
        endFlag = true
    }
}

while !endFlag {
    playRockScissorsPaper()
}
