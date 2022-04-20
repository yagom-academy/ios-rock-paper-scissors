//
//  functions.swift
//  RockPaperScissors
//
//  Created by 전민수 on 2022/04/18.
//

import Foundation

struct Game {
    enum RockPaperScissors: Int {
        case ready, scissors, rock, paper
        
        var koreanName: String {
            switch self {
            case .ready:
                return "준비"
            case .scissors:
                return "가위"
            case .rock:
                return "바위"
            case .paper:
                return "보"
            }
        }
    }
    
    enum MukJjiPpa: Int {
        case ready, muk, jji, ppa
        
        var koreanName: String {
            switch self {
            case .ready:
                return "준비"
            case .muk:
                return "묵"
            case .jji:
                return "찌"
            case .ppa:
                return "빠"
            }
        }
    }
    
    enum GameResult {
        case usersVictory
        case computersVictory
        case tie
    }
    
    func startRPS() {
        let userMenuChoice = selectMenuByInput()
        decideProcessBy(userMenuChoice)
    }
    
    func selectMenuByInput() -> String {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let userInput = readLine() else { return "" }
        return userInput
    }
    
    func decideProcessBy(_ menuChoice: String) {
        switch menuChoice {
        case "0":
            print("게임 종료")
        case "1", "2", "3":
            let eachPick: (RockPaperScissors, RockPaperScissors) = playRPS(by: menuChoice)
            let gameResult = pickOutWinner(from: eachPick)
            printResult(basedOn: gameResult)
            
            restartIfTie(judgingBy: gameResult)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startRPS()
        }
    }
    
    func playRPS(by menuChoice: String) -> (RockPaperScissors, RockPaperScissors) {
        let myRpsPick = convertInputToRps(userInput: menuChoice)
        guard let computerRpsPick = RockPaperScissors(rawValue: Int.random(in: 1...3)) else { return (.ready, .ready) }
        
        return (myRpsPick, computerRpsPick)
    }
    
    func convertInputToRps(userInput: String) -> RockPaperScissors {
        guard let pickNumber = Int(userInput) else { return RockPaperScissors.ready }
        let myRpsPick: RockPaperScissors = RockPaperScissors(rawValue: pickNumber) ?? RockPaperScissors.ready
        
        return myRpsPick
    }
    
    func pickOutWinner(from pickOf: (user: RockPaperScissors, computer: RockPaperScissors)) -> GameResult {
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
    
    func printResult(basedOn gameResult: GameResult) {
        switch gameResult {
        case .usersVictory:
            print("이겼습니다!")
            print("게임 종료")
        case .computersVictory:
            print("졌습니다!")
            print("게임 종료")
        default:
            print("비겼습니다")
        }
    }
    
    func restartIfTie(judgingBy gameResult: GameResult) {
        if gameResult == .tie {
            startRPS()
        }
    }
}
