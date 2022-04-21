//
//  functions.swift
//  RockPaperScissors
//
//  Created by 전민수 on 2022/04/18.
//

import Foundation

struct Game {
    enum InputOfRockPaperScissors: Int {
        case quit, scissors, rock, paper, error
        
        var message: String {
            switch self {
            case .quit:
                return "게임 종료"
            case .scissors:
                return "가위"
            case .rock:
                return "바위"
            case .paper:
                return "보"
            case .error:
                return "잘못된 입력입니다. 다시 시도해주세요."
            }
        }
    }
    
    enum InputOfMukJjiPpa: Int {
        case quit, muk, jji, ppa, error
        
        var message: String {
            switch self {
            case .quit:
                return "게임 종료"
            case .muk:
                return "묵"
            case .jji:
                return "찌"
            case .ppa:
                return "빠"
            case .error:
                return "잘못된 입력입니다. 다시 시도해주세요."
            }
        }
    }
    
    enum GameResult: String {
        case usersVictory = "사용자"
        case computersVictory = "컴퓨터"
        case tie
    }
    
    let menu: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    var attacker: String = ""
    
    mutating func start() {
        let userMenuChoice = selectMenuByInput(menu)
        decideProcessBy(userMenuChoice)
    }
    
    mutating func start(MukJjiPpaLedBy attacker: String) {
        let menu = "[\(attacker) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        let userMenuChoice = selectMenuByInput(OfMukJjiPpa: menu)
        decideProcessBy(userMenuChoice)
    }
    
    func selectMenuByInput(_ menu: String) -> InputOfRockPaperScissors {
        print(menu, terminator: "")
        guard let userInput = readLine() else {
            return .error
        }
        guard let numberChoice = Int(userInput) else {
            return .error
        }
        
        return InputOfRockPaperScissors(rawValue: numberChoice) ?? .error
    }
    
    func selectMenuByInput(OfMukJjiPpa menu: String) -> InputOfMukJjiPpa {
        print(menu, terminator: "")
        guard let userInput = readLine() else {
            return .error
        }
        guard let numberChoice = Int(userInput) else {
            return .error
        }
        
        return InputOfMukJjiPpa(rawValue: numberChoice) ?? .error
    }
    
    mutating func decideProcessBy(_ menuChoice: InputOfRockPaperScissors) {
        switch menuChoice {
        case .quit:
            print(InputOfRockPaperScissors.quit.message)
        case .scissors, .rock, .paper:
            let eachPick: (InputOfRockPaperScissors, InputOfRockPaperScissors) = playGame(by: menuChoice)
            let gameResult = pickOutWinner(from: eachPick)
            printResult(basedOnRockPaperScissors: gameResult)
            
            restartIfTie(judgingBy: gameResult)
        default:
            print(InputOfRockPaperScissors.error.message)
            start()
        }
    }
    
    mutating func decideProcessBy(_ menuChoice: InputOfMukJjiPpa) {
        switch menuChoice {
        case .quit:
            print(InputOfMukJjiPpa.quit.message)
        case .muk, .jji, .ppa:
            let eachPick: (InputOfMukJjiPpa, InputOfMukJjiPpa) = playGame(by: menuChoice)
            let gameResult = pickOutWinner(from: eachPick)
            
            printResult(basedOnMukJjiPpa: gameResult)
            
            quitIfTie(judgingBy: gameResult)
        default:
            print(InputOfRockPaperScissors.error.message)
            attacker = GameResult.computersVictory.rawValue
            start(MukJjiPpaLedBy: attacker)
        }
    }
    
    func playGame(by menuChoice: InputOfRockPaperScissors) -> (InputOfRockPaperScissors, InputOfRockPaperScissors) {
        let myPick = menuChoice
        guard let computerPick = InputOfRockPaperScissors(rawValue: Int.random(in: InputOfRockPaperScissors.scissors.rawValue...InputOfRockPaperScissors.paper.rawValue)) else { return (.quit, .quit) }
        
        return (myPick, computerPick)
    }
    
    func playGame(by menuChoice: InputOfMukJjiPpa) -> (InputOfMukJjiPpa, InputOfMukJjiPpa) {
        let myPick = menuChoice
        guard let computerPick = InputOfMukJjiPpa(rawValue: Int.random(in: InputOfMukJjiPpa.muk.rawValue...InputOfMukJjiPpa.ppa.rawValue)) else { return (.quit, .quit) }
        return (myPick, computerPick)
    }
    
    func pickOutWinner(from pickOf: (user: InputOfRockPaperScissors, computer: InputOfRockPaperScissors)) -> GameResult {
        if pickOf.computer == pickOf.user {
            return .tie
        }
        
        switch (pickOf.user, pickOf.computer) {
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return .usersVictory
        default:
            return .computersVictory
        }
    }
    
    func pickOutWinner(from pickOf: (user: InputOfMukJjiPpa, computer: InputOfMukJjiPpa)) -> GameResult {
        if pickOf.computer == pickOf.user {
            return .tie
        }
        
        switch (pickOf.user, pickOf.computer) {
        case (.muk, .jji), (.jji, .ppa), (.ppa, .muk):
            return .usersVictory
        default:
            return .computersVictory
        }
    }
    
    mutating func printResult(basedOnRockPaperScissors gameResult: GameResult) {
        switch gameResult {
        case .usersVictory:
            print("이겼습니다!")
            attacker = GameResult.usersVictory.rawValue
        case .computersVictory:
            print("졌습니다!")
            attacker = GameResult.computersVictory.rawValue
        default:
            print("비겼습니다")
        }
    }
    
    mutating func printResult(basedOnMukJjiPpa gameResult: GameResult) {
        switch gameResult {
        case .usersVictory:
            attacker = GameResult.usersVictory.rawValue
            print("\(attacker)의 턴입니다.")
        case .computersVictory:
            attacker = GameResult.computersVictory.rawValue
            print("\(attacker)의 턴입니다.")
        default:
            print("\(attacker)의 승리!")
        }
    }
    
    mutating func restartIfTie(judgingBy gameResult: GameResult) {
        if gameResult == .tie {
            start()
        } else {
            start(MukJjiPpaLedBy: attacker)
        }
    }
    
    mutating func quitIfTie(judgingBy gameResult: GameResult) {
        if gameResult == .tie {
            print("게임 종료")
        } else {
            start(MukJjiPpaLedBy: attacker)
        }
    }
}
