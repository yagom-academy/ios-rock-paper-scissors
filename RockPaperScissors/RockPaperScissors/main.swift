//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum RockPaperScissors: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case error
}

enum GameResult {
    case win
    case loss
    case tie
    case error
}

func startRockPaperScissorsGame() {
    var isWinnerFound: Bool = false
    let gameoverNumber: String = "0"
    
    repeat {
        printGameMenu()
        let oneDigitComputerNumber: Int = makeRandomComputerNumber()
        let selectedUserNumber: String = selectGameMenuUserNumber()
        
        if selectedUserNumber == gameoverNumber { break }
        
        let computerValue: RockPaperScissors = convertType(of: String(oneDigitComputerNumber))
        let userValue: RockPaperScissors = convertType(of: selectedUserNumber)
        let gameResult: GameResult = findGameResult(computerValue: computerValue, userValue: userValue)
        
        if gameResult == .win || gameResult == .loss {
            isWinnerFound = true
        }
        printGameResult(gameResult)
    } while !isWinnerFound
    print("게임 종료")
}

func printGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeRandomComputerNumber() -> Int {
    let oneDigitComputerNumber = Int.random(in: 1...3)
    return oneDigitComputerNumber
}

func selectGameMenuUserNumber() -> String {
    guard let selectedUserNumber = readLine() else { return "" }
    return selectedUserNumber
}

func convertType(of selectedNumber: String) -> RockPaperScissors {
    switch selectedNumber {
    case "1":
        return .scissors
    case "2":
        return .rock
    case "3":
        return .paper
    default:
        return .error
    }
}

func findGameResult(computerValue: RockPaperScissors, userValue: RockPaperScissors) -> GameResult {
    switch (computerValue, userValue) {
    case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
        return .win
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        return .loss
    case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
        return .tie
    default:
        return .error
    }
}

func printGameResult(_ gameResult: GameResult) {
    switch gameResult {
    case .win:
        print("이겼습니다!")
    case .loss:
        print("졌습니다!")
    case .tie:
        print("비겼습니다!")
    case .error:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

startRockPaperScissorsGame()
