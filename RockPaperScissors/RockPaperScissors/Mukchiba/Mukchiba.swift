//
//  Mukchiba.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//

struct MukchibaGame {
    func startMukchibaGame(gameTurn: inout GameTurn) {
        printStartWhosTurn(gameTurn: &gameTurn)
        let mukchibaSelectedCard = RefineInput.requestUserInput()
        
        if mukchibaSelectedCard == "0" { return }
        
        if RefineInput.verifyUserInput(of: mukchibaSelectedCard) {
            judgeMatch(of: mukchibaSelectedCard, gameTurn: &gameTurn)
        } else {
            EditionOfOutput.printWrongInput()
            startReMatch(gameTurn: &gameTurn)
        }
    }
    
    private func judgeMatch(of userSecondCard: String, gameTurn: inout GameTurn) {
        let secondRandomCard = generateComputerMukchiba()
        let secondSeletedCard = convertNumberToMukchiba(of: userSecondCard)
        
        if secondSeletedCard == secondRandomCard {
            printWhosVictory(gameTurn: &gameTurn)
        } else {
            judgeMatchResult(inputUserNumber: secondSeletedCard,
                             inputcomputerNumber: secondRandomCard, gameTurn: &gameTurn)
            printWhosTurn(gameTurn: &gameTurn)
            return startMukchibaGame(gameTurn: &gameTurn)
        }
    }
    
    private func startReMatch(gameTurn: inout GameTurn) {
        gameTurn = .computer
        startMukchibaGame(gameTurn: &gameTurn)
    }
    
    private func printStartWhosTurn(gameTurn: inout GameTurn) {
        print("[\(gameTurn.gameTurnType) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    private func printWhosTurn(gameTurn: inout GameTurn) {
        print("\(gameTurn.gameTurnType)의 턴입니다")
    }
    
    private func generateComputerMukchiba() -> Mukchiba {
        let randomNumberRange: ClosedRange<Int> = 1...3
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
    
    private func printWhosVictory(gameTurn: inout GameTurn) {
        print("\(gameTurn.gameTurnType)의 승리!")
    }
    
    private func judgeMatchResult(inputUserNumber: Mukchiba, inputcomputerNumber: Mukchiba,
                                  gameTurn: inout GameTurn) {
        
        if inputUserNumber == .chi {
            inputcomputerNumber == .ba ? (gameTurn = .user) : (gameTurn = .computer)
            return
        }
        
        if inputUserNumber == .ba {
            inputcomputerNumber == .muk ? (gameTurn = .user) : (gameTurn = .computer)
            return
        }
        
        if inputUserNumber == .muk {
            inputcomputerNumber == .chi ? (gameTurn = .user) : (gameTurn = .computer)
            return
        }
    }
}
