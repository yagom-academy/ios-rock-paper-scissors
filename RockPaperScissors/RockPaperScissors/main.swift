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

enum PreviousType: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

var isGameEnd = false
var previousWinner: PreviousType = .user

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
    while !isGameEnd {
        var computerChoice = createRandomRockScissorsPaper()
        printRockScissorsPaper()
        
        let rockScissorsPaperResult = choiceRockScissorsPaper(errorType: .invalidRockScissorsPaper)
        switch rockScissorsPaperResult {
        case .success(let userNumber):
            if isGameEnd(userNumber: userNumber) {
                print("게임 종료")
                isGameEnd = true
                break
            }
            var userChoice = convertChoiceToRockScissorsPaper(userChoice: userNumber)
            let userScenario = checkRockScissorsPaperResult(userChoice: userChoice, with: computerChoice)
            if userScenario == .draw {
                break
            }
            previousWinner = checkWinner(scenario: userScenario)
            while !isGameEnd {
                playMukjippa(&userChoice, with: &computerChoice)
            }
        case .failure(_):
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func checkWinner(scenario: RockScissorsPaperScenario) -> PreviousType {
    scenario == .userWin ? .user : .computer
}

func playMukjippa(_ userChoice: inout RockScissorsPaperType, with computerChoice: inout RockScissorsPaperType) {
    printMukjippa(userChoice, with: computerChoice)
    let mukjippaResult = choiceRockScissorsPaper(errorType: .invalidMukjippa)
    switch mukjippaResult {
    case .success(let userNumber):
        if isGameEnd(userNumber: userNumber) {
            print("게임 종료")
            return
        }
        let randomChoice = createRandomRockScissorsPaper()
        computerChoice = randomChoice
        let userNewChoice = convertChoiceToMukjippa(userChoice: userNumber)
        userChoice = userNewChoice
        checkMukjippaResult(userChoice: userChoice, computerChoice: randomChoice)
    case .failure(_):
        print("잘못된 입력입니다. 다시 시도해주세요.")
        if previousWinner == .user {
            previousWinner = .computer
        } else {
            previousWinner = .user
        }
    }
}

func checkMukjippaResult(userChoice: RockScissorsPaperType, computerChoice: RockScissorsPaperType) {
    let userScenario = compare(userChoice: userChoice, with: computerChoice)
    if userScenario == .userWin {
        previousWinner = .user
        print("사용자의 턴입니다.")
    } else if userScenario == .userLose {
        previousWinner = .computer
        print("컴퓨터의 턴입니다.")
    } else if userScenario == .draw {
        print("\(previousWinner.rawValue)의 승리!")
        isGameEnd = true
    }
}

func printMukjippa(_ userChoice: RockScissorsPaperType, with computerChoice: RockScissorsPaperType) {
    print("[\(previousWinner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: " ")
}

func isGameEnd(userNumber: Int) -> Bool {
    return userNumber == 0 ? true : false
}

playRockScissorsPaper()
