//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum Game {
    case rockPaperScissors
    case mukChiPa
}

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

enum Player: String {
    case computer = "컴퓨터"
    case user = "사용자"
    case nobody
}

enum GameError: Error {
    case wrongInput
}

func operateGames() {
    let firstWinnerTurn = startGame(of: .rockPaperScissors, .nobody)
    
    if firstWinnerTurn == Player.nobody {
        return
    }
    
    let finalGameWinner = startGame(of: .mukChiPa, firstWinnerTurn)
    
    print("\(finalGameWinner.rawValue)의 승리!\n게임 종료")
}

func startGame(of game: Game, _ firstTurn: Player) -> Player {
    var isWinnerFound: Bool = false
    var currentTurn: Player = firstTurn
    let gameoverNumber: String = "0"
    
    repeat {
        printGameMenu(of: game, turnValue: currentTurn.rawValue)
        
        let (computerNumber, userNumber) = generateValues(at: game)
        if userNumber == gameoverNumber {
            break
        }
        
        do {
            let computerValue: RockPaperScissors = try convertType(of: computerNumber)
            let userValue: RockPaperScissors = try convertType(of: userNumber)
            let gameResult: GameResult = findGameResult(computerValue: computerValue, userValue: userValue)
            
            printGameResult(of: game, gameResult)
            isWinnerFound = stopGameLoop(of: game, gameResult)
            currentTurn = changeTurn(currentTurn, gameResult)
            if isWinnerFound == false {
                printCurrentTurn(of: game, currentTurn)
            }
        } catch GameError.wrongInput where game == .mukChiPa {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            currentTurn = .computer
        } catch GameError.wrongInput {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        } catch {
            print(error)
        }
    } while !isWinnerFound
    return currentTurn
}

func printGameMenu(of game: Game, turnValue: String) {
    switch game {
    case .rockPaperScissors:
        printRockPaperScissorsGameMenu()
    case .mukChiPa:
        printMukChiPaGameMenu(turnValue: turnValue)
    }
}

func printRockPaperScissorsGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func printMukChiPaGameMenu(turnValue: String) {
    print("[\(turnValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
}

func generateValues(at game: Game) -> (computerValue: String, userValue: String) {
    var computerNumber: String = ""
    var userNumber: String = ""
    
    switch game {
    case .rockPaperScissors:
        computerNumber = String(generateRandomComputerNumber())
        userNumber = selectGameMenuUserNumber()
    case .mukChiPa:
        computerNumber = convertMukChiPa(generateRandomComputerNumber())
        userNumber = convertMukChiPa((selectGameMenuUserNumber().map { Int(String($0)) ?? -1 })[0])
    }
    return (computerNumber, userNumber)
}

func generateRandomComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

func convertMukChiPa(_ number: Int) -> String {
    switch number {
    case 1:
        return "2"
    case 2:
        return "1"
    case 3:
        return "3"
    case 0:
        return "0"
    default:
        break
    }
    return "-1"
}

func convertType(of selectedNumber: String) throws -> RockPaperScissors {
    guard let value = RockPaperScissors(rawValue: selectedNumber) else {
        throw GameError.wrongInput
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

func printGameResult(of game: Game, _ gameResult: GameResult) {
    if game == .mukChiPa {
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

func selectGameMenuUserNumber() -> String {
    guard let selectedUserNumber = readLine() else {
        return ""
    }
    return selectedUserNumber
}

func stopGameLoop(of game: Game, _ gameResult: GameResult) -> Bool {
    var isWinnerFound = false
    
    if game == .rockPaperScissors && gameResult != .tie {
        isWinnerFound = true
    }
    if game == .mukChiPa && gameResult == .tie {
        isWinnerFound = true
    }
    return isWinnerFound
}

func changeTurn(_ currentValue: Player, _ gameResult: GameResult) -> Player {
    switch gameResult {
    case .win:
        return .user
    case .loss:
        return .computer
    default:
        return currentValue
    }
}

func printCurrentTurn(of game: Game, _ turn: Player) {
    if game == .rockPaperScissors {
        return
    }
    print("\(turn.rawValue)의 턴입니다.")
}

operateGames()
