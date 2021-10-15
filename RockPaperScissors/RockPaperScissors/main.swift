//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum ScissorsRockPaperError: Error {
    case wrongInput
    case notConverted
}

enum ScissorsRockPaper: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    func winCase() -> ScissorsRockPaper {
        switch self {
        case .scissors:
            return .rock
        case .rock:
            return .paper
        case .paper:
            return .scissors
        }
    }
    
    func convertMukChiBa() -> ScissorsRockPaper {
        switch self {
        case .scissors:
            return .rock
        case .rock:
            return .scissors
        case .paper:
            return .paper
        }
    }
    
    static func createRandomCase() -> ScissorsRockPaper {
        return ScissorsRockPaper.allCases.randomElement() ?? .scissors
    }
}

enum MukChiBaGameResult: String {
    case win
    case changeTurn
    case keepTurn
    
    func show(player: Player) {
        switch self {
        case .win:
            print("\(player)의 승리!")
        case .changeTurn:
            print("\(player.anotherPlayer())의 턴입니다.")
        case .keepTurn:
            print("\(player)의 턴입니다.")
        }
    }
}

enum ScissorsRockPaperGameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    
    func show() {
        print(self.rawValue)
    }
}

enum Player: String {
    case user = "사용자"
    case computer = "컴퓨터"
    
    func anotherPlayer() -> Player {
        switch self {
        case .user:
            return .computer
        case .computer:
            return .user
        }
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}

typealias MukChiBaGamePlayer = (player: Player, pick: ScissorsRockPaper)

func startMukChiBaGame(hasTurn: Player?) {
    guard let hasTurnPlayer = hasTurn else {
        return
    }
    
    printMukChiBaMenu(hasTurnPlayer)
    
    do {
        let userInput = try receiveUserInput()
        
        guard isExitGame(input: userInput) == false else {
            printGameOver()
            return
        }
        
        let usersPick: ScissorsRockPaper = try convert(into: userInput).convertMukChiBa()
        
        let computerPick: ScissorsRockPaper = ScissorsRockPaper.createRandomCase()
        
        let attacker: MukChiBaGamePlayer = decideAttackerAndDefender(by: hasTurnPlayer, usersPick: usersPick, computerPick: computerPick).attacker
        let defender: MukChiBaGamePlayer = decideAttackerAndDefender(by: hasTurnPlayer, usersPick: usersPick, computerPick: computerPick).defender
        
        let gameResult: MukChiBaGameResult = compareMukChiBa(to: attacker.pick, with: defender.pick)
        gameResult.show(player: attacker.player)
        
        guard isAttackerWin(to: gameResult) == false else {
            printGameOver()
            return
        }
        
        if gameResult == .keepTurn {
            startMukChiBaGame(hasTurn: attacker.player)
        } else {
            startMukChiBaGame(hasTurn: defender.player)
        }
        
    } catch ScissorsRockPaperError.wrongInput,
            ScissorsRockPaperError.notConverted {
        printErrorMessage()
        startMukChiBaGame(hasTurn: .computer)
    } catch {
        print(error)
    }
}

func decideAttackerAndDefender(by hasTurnPlayer: Player, usersPick: ScissorsRockPaper, computerPick: ScissorsRockPaper) -> (attacker: MukChiBaGamePlayer, defender: MukChiBaGamePlayer) {
    
    let attacker: (player: Player, pick: ScissorsRockPaper)
    let defender: (player: Player, pick: ScissorsRockPaper)
    
    if hasTurnPlayer == .user {
        attacker = (.user, usersPick)
        defender = (.computer, computerPick)
    } else {
        attacker = (.computer, computerPick)
        defender = (.user, usersPick)
    }
    
    return (attacker, defender)
}

func startScissorsRockPaperGame() -> Player? {
    var isScissorsRockPaperRuning = true
    var gameResult: ScissorsRockPaperGameResult = .draw
    
    while isScissorsRockPaperRuning {
        printScissorsRockPaperMenu()
        
        do {
            let userInput = try receiveUserInput()
            
            guard isExitGame(input: userInput) == false else {
                printGameOver()
                return nil
            }
            
            let usersPick: ScissorsRockPaper = try convert(into: userInput)
            
            let computerPick: ScissorsRockPaper = ScissorsRockPaper.createRandomCase()
            
            gameResult = compareScissorsRockPaper(to: usersPick, with: computerPick)
            gameResult.show()
            
            if isDrawScissorsRockPaperGame(to: gameResult) == false {
                isScissorsRockPaperRuning = false
            }
            
        } catch ScissorsRockPaperError.wrongInput,
                ScissorsRockPaperError.notConverted {
            printErrorMessage()
        } catch {
            print(error)
        }
    }
    
    return gameResult == .win ? .user : .computer
}

func isDrawScissorsRockPaperGame(to result: ScissorsRockPaperGameResult) -> Bool {
    return result == .draw
}

func isAttackerWin(to result: MukChiBaGameResult) -> Bool {
    return result == .win
}

func isExitGame(input: Int) -> Bool {
    return input == 0
}

func printScissorsRockPaperMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func printMukChiBaMenu(_ player: Player) {
    print("[\(player) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
}

func receiveUserInput() throws -> Int {
    guard let input = readLine(), let convertedInteger = Int(input) else {
        throw ScissorsRockPaperError.wrongInput
    }
    
    return convertedInteger
}

func compareMukChiBa(to attackerPick: ScissorsRockPaper, with defenderPick: ScissorsRockPaper) -> MukChiBaGameResult {
    if attackerPick == defenderPick {
        return .win
    } else if attackerPick == defenderPick.winCase() {
        return .keepTurn
    } else {
        return .changeTurn
    }
}

func compareScissorsRockPaper(to usersPick: ScissorsRockPaper, with computerRandomPick: ScissorsRockPaper) -> ScissorsRockPaperGameResult {
    if usersPick == computerRandomPick {
        return .draw
    } else if usersPick == computerRandomPick.winCase() {
        return .win
    } else {
        return .lose
    }
}

func convert(into number: Int) throws -> ScissorsRockPaper {
    guard let convertedScissorsRockPaper = ScissorsRockPaper(rawValue: number) else {
        throw ScissorsRockPaperError.notConverted
    }
    
    return convertedScissorsRockPaper
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printGameOver() {
    print("게임 종료")
}

let scissorRockPaperWinner: Player? = startScissorsRockPaperGame()
startMukChiBaGame(hasTurn: scissorRockPaperWinner)
