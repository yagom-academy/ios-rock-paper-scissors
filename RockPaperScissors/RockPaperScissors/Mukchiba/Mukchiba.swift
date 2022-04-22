//
//  Mukchiba.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//

struct MukchibaGame {
    func startMukchibaGame() {
        printStartWhosTurn()
        
        let secondSelectedNumber = RefineInput.requestUserInput()
        
        if secondSelectedNumber == "0" { return }
        
        if RefineInput.verifyUserInput(of: secondSelectedNumber) {
            judgeMatch(of: secondSelectedNumber)
        } else {
            EditionOfOutput.printWrongInput()
            startReMatch()
        }
    }
    
    private func judgeMatch(of userSecondCard: String) {
        let secondRandomCard = generateComputerMukchiba()
        let secondSeletedCard = convertNumberToMukchiba(of: userSecondCard)
        
        if secondSeletedCard == secondRandomCard {
            printWhosVictory()
        } else {
            judgeMatchResult(inputUserNumber: secondSeletedCard,
                             inputcomputerNumber: secondRandomCard)
            printWhosTurn()
            return startMukchibaGame()
        }
    }
    
    private func startReMatch() {
        if gameTurn == "컴퓨터" {
            startMukchibaGame()
        } else {
            gameTurn = "컴퓨터"
            startMukchibaGame()
        }
    }
    
    private func printStartWhosTurn() {
        print("[\(gameTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    private func printWhosTurn() {
        print("\(gameTurn)의 턴입니다")
    }
    
    private func generateComputerMukchiba() -> Mukchiba {
        return Mukchiba(rawValue: Int.random(in: randomNumberRange)) ?? .wrong
    }
    
    private func convertNumberToMukchiba(of targetNumber: String) -> Mukchiba {
        switch targetNumber {
        case "1":
            return .muk
        case "2":
            return .chi
        case "3":
            return .ba
        default:
            return .wrong
        }
    }
    
    private func printWhosVictory() {
        print("\(gameTurn)의 승리!")
    }
    
    private func judgeMatchResult(inputUserNumber: Mukchiba, inputcomputerNumber: Mukchiba) {
        if inputUserNumber == .chi {
            inputcomputerNumber == .ba ? (gameTurn = "사용자") : (gameTurn = "컴퓨터")
        } else if inputUserNumber == .ba {
            inputcomputerNumber == .muk ? (gameTurn = "사용자") : (gameTurn = "컴퓨터")
        } else {
            inputcomputerNumber == .chi ? (gameTurn = "사용자") : (gameTurn = "컴퓨터")
        }
    }
}
