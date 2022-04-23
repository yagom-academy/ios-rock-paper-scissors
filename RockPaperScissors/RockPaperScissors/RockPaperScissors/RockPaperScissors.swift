//
//  RockPaperScissors.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//

struct RockPaperScissorsGame {
    func startRockPaperScissorsGame( gameTurn: inout GameTurn) -> RockPaperScissorsResult {
        
        printUserInterface()
        let userSelectedCard = RefineInput.requestUserInput()
        
        if userSelectedCard == "0" {
            return .none
        } else if RefineInput.verifyUserInput(of: userSelectedCard) {
            let targetNumber = convertNumberToGameCard(of: userSelectedCard)
            let computerRandomNumber = generateComputerNumber()
            let gameResult = judgeMatchResult(inputUserNumber: targetNumber,
                             inputcomputerNumber: computerRandomNumber)
            printMatchResult(matchResult: gameResult, changeTurn: &gameTurn)
            return gameResult
        } else {
            EditionOfOutput.printWrongInput()
            return startRockPaperScissorsGame(gameTurn: &gameTurn)
        }
    }
    
    private func printUserInterface() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    private func judgeMatchResult(inputUserNumber: RockPaperScissors,
                                  inputcomputerNumber: RockPaperScissors) ->
                                                           RockPaperScissorsResult {
        if inputUserNumber == inputcomputerNumber {
            return .tie
        }
        
        if inputUserNumber == .scissors {
            return inputcomputerNumber == .paper ? .win : .lose
        }
        
        if inputUserNumber == .paper {
            return inputcomputerNumber == .rock ? .win : .lose
        }
        
        if inputUserNumber == .rock {
            return inputcomputerNumber == .scissors ? .win : .lose
        }
        return .none
    }
    
    private func convertNumberToGameCard(of targetNumber: String) -> RockPaperScissors {
        switch targetNumber {
        case "1":
            return .scissors
        case "2":
            return .rock
        case "3":
            return .paper
        default:
            return .wrong
        }
    }
    
    private func generateComputerNumber() -> RockPaperScissors {
        let randomNumberRange: ClosedRange<Int> = 1...3
        return RockPaperScissors(rawValue: Int.random(in: randomNumberRange)) ?? .wrong
    }
    
    private func printMatchResult(matchResult: RockPaperScissorsResult,
                                  changeTurn: inout GameTurn) {
        switch matchResult {
        case .win:
            print("이겼습니다!")
            changeTurn = .user
        case .lose:
            print("졌습니다!")
            changeTurn = .computer
        case .tie:
            print("비겼습니다!")
        case .none:
            break
        }
    }
}
