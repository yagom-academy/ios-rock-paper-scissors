//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum RockPaperScissors: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

enum GameResult {
    case win
    case loss
    case tie
}

enum InputError: Error {
    case wrongInputError
}

enum ComputerOrUser: String {
    case computer = "컴퓨터"
    case user = "사용자"
}

func startRockPaperScissorsGame() {
    var isWinnerFound: Bool = false
    let gameoverNumber: String = "0"
    
    repeat {
        do {
            printGameMenu()
            let computerNumber: Int = makeRandomComputerNumber()
            let userNumber: String = selectGameMenuUserNumber()
            
            if userNumber == gameoverNumber {
                break
            }
            
            let computerValue: RockPaperScissors = try convertType(of: String(computerNumber))
            let userValue: RockPaperScissors = try convertType(of: userNumber)
            let gameResult: GameResult = findGameResult(computerValue: computerValue, userValue: userValue)
            
            if gameResult != .tie {
                isWinnerFound = true
            }
            printGameResult(gameResult)
        } catch InputError.wrongInputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        } catch {
            print(error)
        }
    } while !isWinnerFound
    print("게임 종료")
}

func printGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeRandomComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

func selectGameMenuUserNumber() -> String {
    guard let selectedUserNumber = readLine() else {
        return ""
    }
    return selectedUserNumber
}

func convertType(of selectedNumber: String) throws -> RockPaperScissors {
    guard let value = RockPaperScissors(rawValue: selectedNumber) else {
        throw InputError.wrongInputError
    }
    return value
}

func findGameResult(computerValue: RockPaperScissors, userValue: RockPaperScissors) -> GameResult {
    switch (computerValue, userValue) {
    case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
        return .win
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        return .loss
    case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
        return .tie
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
    }
}

//func start묵찌빠game() {
//
//}

func print묵찌빠gameMenu(turnValue: String) {
    print("[\(turnValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0>: ", terminator: "")
}

startRockPaperScissorsGame()


