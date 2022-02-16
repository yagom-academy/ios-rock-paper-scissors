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

enum Game {
    case 가위바위보
    case 묵찌빠
}

func startRockPaperScissorsGame(game: Game, winner: Bool) -> ComputerOrUser {
    var isWinnerFound: Bool = winner
    var currentTurn: ComputerOrUser = .user
    let gameoverNumber: String = "0"
    
    repeat {
        do {
            printGameMenu(of: game, turnValue: currentTurn.rawValue)
            let computerNumber: Int = makeRandomComputerNumber()
            print("컴퓨터 랜덤 넘버: ",computerNumber)
            let userNumber: String = selectGameMenuUserNumber()
            
            if userNumber == gameoverNumber {
                break
            }
            
            let computerValue: RockPaperScissors = try convertType(of: String(computerNumber))
            let userValue: RockPaperScissors = try convertType(of: userNumber)
            let gameResult: GameResult = findGameResult(computerValue: computerValue, userValue: userValue)
            
            printGameResult(gameResult)
            if gameResult == .win {
                currentTurn = .user
                isWinnerFound = true
            } else if gameResult == .loss {
                currentTurn = .computer
                isWinnerFound = true
            } else if gameResult == .tie {
                isWinnerFound = false
            }
        } catch InputError.wrongInputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        } catch {
            print(error)
        }
    } while !isWinnerFound
    return currentTurn
}

func print가위바위보GameMenu() {
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

func print묵찌빠gameMenu(turnValue: String) {
    print("[\(turnValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
}

func printGameMenu(of game: Game, turnValue: String) {
    switch game {
    case .가위바위보:
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    case .묵찌빠:
        print("[\(turnValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")

    }
}

func gameMaster() {
    let turn = startRockPaperScissorsGame(game: .가위바위보, winner: false)
    print("가위바위보 승리자",turn)
    let winnerTurn = startRockPaperScissorsGame(game: .묵찌빠, winner: false)
    print("묵찌빠 승리자",winnerTurn)
}

gameMaster()
