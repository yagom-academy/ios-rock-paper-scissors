//
//  functions.swift
//  RockPaperScissors
//
//  Created by 전민수 on 2022/04/18.
//

import Foundation

struct RockPaperScissors {
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
    
    enum GameResult: String {
        case usersVictory = "사용자"
        case computersVictory = "컴퓨터"
        case tie
    }
    
    private let menu: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    static var attacker: String = ""
    
    mutating func start() {
        let userMenuChoice = selectMenuByInput(menu)
        decideProcessBy(userMenuChoice)
    }
    
    private func selectMenuByInput(_ menu: String) -> InputOfRockPaperScissors {
        print(menu, terminator: "")
        guard let userInput = readLine() else {
            return .error
        }
        guard let numberChoice = Int(userInput) else {
            return .error
        }
        
        return InputOfRockPaperScissors(rawValue: numberChoice) ?? .error
    }
    
    private mutating func decideProcessBy(_ menuChoice: InputOfRockPaperScissors) {
        switch menuChoice {
        case .quit:
            print(InputOfRockPaperScissors.quit.message)
        case .scissors, .rock, .paper:
            let eachPick: (InputOfRockPaperScissors, InputOfRockPaperScissors) = play(by: menuChoice)
            let gameResult = pickOutWinner(from: eachPick)
            printResult(basedOnRockPaperScissors: gameResult)
            
            restartIfTie(judgingBy: gameResult)
        default:
            print(InputOfRockPaperScissors.error.message)
            start()
        }
    }
    
    private func play(by menuChoice: InputOfRockPaperScissors) -> (InputOfRockPaperScissors, InputOfRockPaperScissors) {
        let myPick = menuChoice
        guard let computerPick = InputOfRockPaperScissors(rawValue: Int.random(in: InputOfRockPaperScissors.scissors.rawValue...InputOfRockPaperScissors.paper.rawValue)) else { return (.quit, .quit) }
        
        return (myPick, computerPick)
    }
    
    private func pickOutWinner(from pickOf: (user: InputOfRockPaperScissors, computer: InputOfRockPaperScissors)) -> GameResult {
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
    
    private mutating func printResult(basedOnRockPaperScissors gameResult: GameResult) {
        switch gameResult {
        case .usersVictory:
            print("이겼습니다!")
            RockPaperScissors.attacker = GameResult.usersVictory.rawValue
        case .computersVictory:
            print("졌습니다!")
            RockPaperScissors.attacker = GameResult.computersVictory.rawValue
        default:
            print("비겼습니다")
        }
    }
    
    private mutating func restartIfTie(judgingBy gameResult: GameResult) {
        if gameResult == .tie {
            start()
        } else {
            var mukJjiPpa = MukJjiPpa()
            mukJjiPpa.start(MukJjiPpaLedBy: RockPaperScissors.attacker)
        }
    }
}
