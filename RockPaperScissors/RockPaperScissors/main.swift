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
    case nobody
}

enum Game {
    case 가위바위보
    case 묵찌빠
}

func startRockPaperScissorsGame(game: Game, currentTurnParameter: ComputerOrUser) -> ComputerOrUser {
    var isWinnerFound: Bool = false
    var currentTurn: ComputerOrUser = currentTurnParameter
    let gameoverNumber: String = "0"
    
    repeat {
        printGameMenu(of: game, turnValue: currentTurn.rawValue)
        
        var computerNumber: String = ""
        var userNumber: String = ""
        
        (computerNumber, userNumber) = generateValues(game: game)
        
        if userNumber == gameoverNumber {
            break
        }
        
        do {
            let computerValue: RockPaperScissors = try convertType(of: computerNumber)
            let userValue: RockPaperScissors = try convertType(of: userNumber)
            let gameResult: GameResult = findGameResult(computerValue: computerValue, userValue: userValue)
            
            printGameResult(game: game, gameResult)
            
            isWinnerFound = stopGameLoop(game: game, gameResult: gameResult)
            currentTurn = changeTurn(currentValue: currentTurn, gameResult: gameResult)
            
            if isWinnerFound == false {
                printCurrentTrun(game: game, turn: currentTurn)
            }
            
        } catch InputError.wrongInputError where game == .묵찌빠 {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            currentTurn = .computer
        } catch InputError.wrongInputError {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        } catch {
            print(error)
        }
    } while !isWinnerFound
    return currentTurn
}

func generateValues(game: Game) -> (computerValue: String, userValue: String) {
    var computerNumber: String = ""
    var userNumber: String = ""
    
    switch game {
    case .가위바위보:
        computerNumber = String(makeRandomComputerNumber())
        userNumber = selectGameMenuUserNumber()
    case .묵찌빠:
        computerNumber = changeTo묵찌빠(number: makeRandomComputerNumber())
        let tempNumber = Int(selectGameMenuUserNumber()) ?? -1
        userNumber = changeTo묵찌빠(number: tempNumber)
    }
    return (computerNumber, userNumber)
}

func stopGameLoop(game: Game, gameResult: GameResult) -> Bool {
    var isWinnerFound = false
    
    if game == .가위바위보 && gameResult != .tie {
        isWinnerFound = true
    }
   
    if game == .묵찌빠 && gameResult == .tie {
        isWinnerFound = true
    }
    
    return isWinnerFound
}

func changeTurn(currentValue: ComputerOrUser, gameResult: GameResult) -> ComputerOrUser {
    var currentValue1 = currentValue
    
    if gameResult == .win {
        currentValue1 = .user
    } else if gameResult == .loss {
        currentValue1 = .computer
    }
    return currentValue1
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

func printCurrentTrun(game: Game, turn: ComputerOrUser) {
    if game == .가위바위보 {
        return
    }
    print("\(turn.rawValue)의 턴입니다.")
}

func printGameResult(game: Game, _ gameResult: GameResult) {
    
    if game == .묵찌빠 {
        return
    }
    
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
        print가위바위보GameMenu()
    case .묵찌빠:
        print묵찌빠gameMenu(turnValue: turnValue)
    }
}

func gameMaster() {
    let turn = startRockPaperScissorsGame(game: .가위바위보, currentTurnParameter: .nobody)
    
    if turn == ComputerOrUser.nobody {
        return
    }
    
    let winnerTurn = startRockPaperScissorsGame(game: .묵찌빠, currentTurnParameter: turn)
    print("\(winnerTurn.rawValue)의 승리!\n게임 종료")
}

func changeTo묵찌빠(number: Int) -> String {
    if number == 1 {
        return "2"
    } else if number == 2 {
        return "1"
    } else if number == 3 {
        return "3"
    } else if number == 0 {
        return "0"
    }
    return "-1"
}

gameMaster()
