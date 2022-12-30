//
//  RockScissorsPaperGameManager.swift
//  RockPaperScissors
//
//  Created by Harry, Andrew on 2022/12/28.
//
import Foundation

class RockScissorsPaperGameManager {
    func startGame() {
        var gameFlow: GameFlow = .keepPlaying
        var matchResult: MatchResult?
        
        while gameFlow == .keepPlaying {
            let rockScissorsPaperResult = playRockPaperScissors()
            
            matchResult = rockScissorsPaperResult.matchResult
            printMatchResult(matchResult: matchResult)
            gameFlow = rockScissorsPaperResult.gameFlow
        }
        
        guard let turn = informResultToMukJiPPa(matchResult: matchResult) else { return }
        
        let mukJiPPaGameManager = MukJiPPaGameManager()
        
        mukJiPPaGameManager.showTurn = turn
        gameFlow = .keepPlaying
        
        while gameFlow == .keepPlaying {
            let mukJiPPaResult = mukJiPPaGameManager.startMukJiPPaGame()
            gameFlow = mukJiPPaResult.gameFlow
            
            guard let winner = mukJiPPaResult.mukJiPPaTurn else {
                continue
            }
            
            if winner != .gameEnd {
                continue
            }
            print("\(mukJiPPaGameManager.showTurn.rawValue)의 승리!")
        }
    }
    
    func playRockPaperScissors() -> (matchResult: MatchResult?, gameFlow: GameFlow) {
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
            return (nil, .keepPlaying)
        } catch {
            print(error.localizedDescription)
            return (nil, .keepPlaying)
        }
        
        let userHand = generateUserHand(validationResult: userNumber)
        let computerHand = generateComputerHand()
        let matchResult = compareHandShape(computerHand: computerHand, userHand: userHand)
        
        switch matchResult {
        case .lose, .win:
            return (matchResult, .gameOver)
        default:
            return (matchResult, .keepPlaying)
        }
    }
    
    func printMatchResult(matchResult: MatchResult?) {
        if let matchResult = matchResult {
            switch matchResult {
            case .win:
                print("이겼습니다!")
            case .same:
                print("비겼습니다!")
            case .lose:
                print("졌습니다!")
            }
        }
    }
    
    func informResultToMukJiPPa(matchResult: MatchResult?) -> MukJiPPaTurn? {
        if let matchResult = matchResult {
            switch matchResult {
            case .win:
                return .user
            case .same:
                return nil
            case .lose:
                return .computer
            }
        }
        
        return nil
    }
    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료: 0>", terminator: ": ")
    }
    
    func readUserInput() -> String {
        guard let userInput = readLine() else {
            return ""
        }
        
        return userInput
    }
    
    func validateUserInput(userInput: String) throws -> Int {
        guard userInput != "",
              let number = Int(userInput),
              number >= 0, number <= 3 else {
            throw InputError.invalidInput
        }
        
        return number
    }
    
    func generateUserHand(validationResult: Int) -> HandShape? {
        let handShapeList: [HandShape?] = HandShape.allCases
        
        guard let userHand = handShapeList[validationResult - 1] else {
            return nil
        }
        
        return userHand
    }
    
    func generateComputerHand() -> HandShape? {
        guard let computerHand = HandShape.allCases.randomElement() else {
            return nil
        }
        
        return computerHand
    }
    
    func compareHandShape(computerHand: HandShape?, userHand: HandShape?) -> MatchResult? {
        guard let computerHand = computerHand, let userHand = userHand else {
            return nil
        }
        
        switch (computerHand, userHand) {
        case (.rock, .scissors),
            (.scissors, .paper),
            (.paper, .rock):
            return .lose
        case (.scissors, .rock),
            (.paper, .scissors),
            (.rock, .paper):
            return .win
        default:
            return .same
        }
    }
}
