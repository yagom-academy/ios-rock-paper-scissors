//
//  MukJiPPaGameManager.swift
//  RockPaperScissors
//
//  Created by Harry, Andrew on 2022/12/28.
//

import Foundation

class MukJiPPaGameManager: RockScissorsPaperGameManager {
    var turn: String = ""
    
    override func printMenu() {
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0>", terminator: ": ")
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
    
    func informTurn(matchResult: MatchResult?) -> MukJiPPaTurn {
        if let matchResult = matchResult {
            switch matchResult {
            case .win:
                self.turn = "사용자"
                return .user
            case .same:
                return .gameEnd
            case .lose:
                self.turn = "컴퓨터"
                return .computer
            }
        }
        
        return .gameEnd
    }
    
    override func startGame() -> (whosTurn: String?, gameFlow: GameFlow) {
        let result = playMukJiPPa()
        let matchResult = result.matchResult
        let gameFlow = result.gameFlow
        
        if gameFlow == .gameOver {
            return (nil, .gameOver)
        }
        
        guard let _ = informMatchResult(matchResult: matchResult) else {
            return (self.turn, .gameOver)
        }
        
        return (nil, .keepPlaying)
    }
}
