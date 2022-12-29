//
//  MukJiPPaGameManager.swift
//  RockPaperScissors
//
//  Created by Harry, Andrew on 2022/12/28.
//

import Foundation

class MukJiPPaGameManager: RockScissorsPaperGameManager {
    var whosTurn: String = "***"
    
    override func printMenu() {
        print("[\(whosTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0>", terminator: ": ")
    }
    
    func turn(matchResult: MatchResult?) {
        guard let matchResult = matchResult else {
            return
        }
        
        switch matchResult {
        case .win:
            print("사용자 턴")
        case .lose:
            print("컴퓨터 턴")
        case .same:
            print("게임 끝")
        }
    }
    
    func playMukJiPPa() -> (matchResult: MatchResult?, gameFlow: GameFlow) {
        printMenu()
        let input = readUserInput()
        var userNumber = 0
        
        do {
            userNumber = try validateUserInput(userInput: input)
            if userNumber == 0 {
                print("게임 종료")
                return (nil, .gameOver)
            }
        } catch InputError.invalidInput {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return (.lose, .keepPlaying)
        } catch {
            print(error.localizedDescription)
            return (nil, .keepPlaying)
        }
        
        let userHand = generateUserHand(validationResult: userNumber)
        let computerHand = generateComputerHand()
        let matchResult = compareHandShape(computerHand: computerHand, userHand: userHand)
        
        return (matchResult, .keepPlaying)
    }
    
    override func informMatchResult(matchResult: MatchResult?) -> String? {
        if let matchResult = matchResult {
            switch matchResult {
            case .win:
                self.whosTurn = "사용자"
                print("사용자의 턴입니다.")
                return "사용자"
            case .same:
                return nil
            case .lose:
                self.whosTurn = "컴퓨터"
                print("컴퓨터의 턴입니다.")
                return "컴퓨터"
            }
        }
        
        return nil
    }
    
    override func startGame() -> (whosTurn: String?, gameFlow: GameFlow) {
        let result = playMukJiPPa()
        let matchResult = result.matchResult
        let gameFlow = result.gameFlow
        
        if gameFlow == .gameOver {
            return (nil, .gameOver)
        }
        
        guard let _ = informMatchResult(matchResult: matchResult) else {
            return (self.whosTurn, .gameOver)
        }
        
        return (nil, .keepPlaying)
    }
}
