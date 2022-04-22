//
//  MukJjiPpa.swift
//  RockPaperScissors
//
//  Created by Minseong Kang on 2022/04/22.
//

import Foundation


struct MukJjiPpa {
    
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
    
    private var attacker = RockPaperScissors.attacker
    
    mutating func start(MukJjiPpaLedBy attacker: String) {
        let menu = "[\(attacker) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        let userMenuChoice = selectMenuByInput(OfMukJjiPpa: menu)
        decideProcessBy(userMenuChoice)
    }
    
    private func selectMenuByInput(OfMukJjiPpa menu: String) -> InputOfMukJjiPpa {
        print(menu, terminator: "")
        guard let userInput = readLine() else {
            return .error
        }
        guard let numberChoice = Int(userInput) else {
            return .error
        }
        
        return InputOfMukJjiPpa(rawValue: numberChoice) ?? .error
    }
    
    private mutating func decideProcessBy(_ menuChoice: InputOfMukJjiPpa) {
        switch menuChoice {
        case .quit:
            print(InputOfMukJjiPpa.quit.message)
        case .muk, .jji, .ppa:
            let eachPick: (InputOfMukJjiPpa, InputOfMukJjiPpa) = play(by: menuChoice)
            let gameResult = pickOutWinner(from: eachPick)
            
            printResult(basedOnMukJjiPpa: gameResult)
            
            quitIfTie(judgingBy: gameResult)
        default:
            print(InputOfMukJjiPpa.error.message)
            attacker = GameResult.computersVictory.rawValue
            start(MukJjiPpaLedBy: attacker)
        }
    }
    
    private func play(by menuChoice: InputOfMukJjiPpa) -> (InputOfMukJjiPpa, InputOfMukJjiPpa) {
        let myPick = menuChoice
        guard let computerPick = InputOfMukJjiPpa(rawValue: Int.random(in: InputOfMukJjiPpa.muk.rawValue...InputOfMukJjiPpa.ppa.rawValue)) else { return (.quit, .quit) }
        print("사용자: \(myPick), 컴퓨터: \(computerPick)")
        return (myPick, computerPick)
    }
    
    private func pickOutWinner(from pickOf: (user: InputOfMukJjiPpa, computer: InputOfMukJjiPpa)) -> GameResult {
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
    
    private mutating func printResult(basedOnMukJjiPpa gameResult: GameResult) {
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
    
    private mutating func quitIfTie(judgingBy gameResult: GameResult) {
        if gameResult == .tie {
            print("게임 종료")
        } else {
            start(MukJjiPpaLedBy: attacker)
        }
    }
    
    
}
