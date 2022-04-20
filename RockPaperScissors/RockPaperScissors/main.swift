//
//  RockPaperScissors - main.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var continueGameCheck: Bool = true
var gameTurn: String = ""
let randomNumberRange: ClosedRange<Int> = 1...3

func startGame() {
    while continueGameCheck {
        printUserInterface()
        let userSelectedCard = requestUserInput()
        
        if userSelectedCard == "0" {
            endGame()
        } else if verifyUserInput(of: userSelectedCard) {
            let targetNumber = convertNumberToGameCard(of: userSelectedCard)
            let computerRandomNumber = generateComputerNumber()
            judgeMatchResult(of: .rockscissors, inputUserNumber: targetNumber,
                             inputcomputerNumber: computerRandomNumber)
            startMukchibaGame()
        } else {
            printWrongInput()
        }
    }
    printGameOver()
}

func requestUserInput() -> String {
    return readLine()?.trimmingCharacters(in: .whitespaces) ?? ""
}

func startMukchibaGame() {
    
    if gameTurn.isEmpty {
        return
    }
    
    printStartWhosTurn()
    let secondSelectedNumber = requestUserInput()
    
    if secondSelectedNumber == "0" {
        endGame()
        return
    }
    
    if verifyUserInput(of: secondSelectedNumber) {
        let secondRandomCard = generateComputerMukchiba()
        let secondSeletedCard = convertNumberToMukchiba(of: secondSelectedNumber)
        
        if secondSeletedCard == secondRandomCard {
            printWhosVictory()
            endGame()
        } else {
            judgeMatchResult(of: .mukchiba, inputUserNumber: secondSeletedCard,
                             inputcomputerNumber: secondRandomCard)
            printWhosTurn()
            return startMukchibaGame()
        }
    } else {
        printWrongInput()
        
        if gameTurn == "컴퓨터" {
            startMukchibaGame()
        } else {
            gameTurn = "컴퓨터"
            startMukchibaGame()
        }
    }
}

func printUserInterface() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func generateComputerNumber() -> RockPaperScissors {
    return RockPaperScissors(rawValue: Int.random(in: randomNumberRange)) ?? .wrong
}

func generateComputerMukchiba() -> Mukchiba {
    return Mukchiba(rawValue: Int.random(in: randomNumberRange)) ?? .wrong
}

func verifyUserInput(of userChoiceCard: String) -> Bool {
    let cardList: Array<String> = ["1","2","3"]
    
    if cardList.contains(userChoiceCard) {
        return true
    } else {
        return false
    }
}

func convertNumberToGameCard(of targetNumber: String) -> RockPaperScissors {
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

func convertNumberToMukchiba(of targetNumber: String) -> Mukchiba {
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

func printWrongInput() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printStartWhosTurn() {
    print("[\(gameTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
}

func printWhosTurn() {
    print("\(gameTurn)의 턴입니다")
}

func printGameOver() {
    print("게임 종료")
}

func printWhosVictory() {
    print("\(gameTurn)의 승리!")
}

func endGame() {
    continueGameCheck = false
}

func judgeMatchResult(of inputGameType: GameType, inputUserNumber: Mukchiba,
                      inputcomputerNumber: Mukchiba) {
    if inputUserNumber == inputcomputerNumber {
        printMatchResult(matchResult: .tie)
        return
    }
    
    if inputUserNumber == .chi {
        inputcomputerNumber == .ba ?
        (gameTurn = "사용자") : (gameTurn = "컴퓨터")
    }
    
    if inputUserNumber == .ba {
        inputcomputerNumber == .muk ?
        (gameTurn = "사용자") : (gameTurn = "컴퓨터")
    }
    
    if inputUserNumber == .muk {
        inputcomputerNumber == .chi ?
        (gameTurn = "사용자") : (gameTurn = "컴퓨터")
    }
}

func judgeMatchResult(of inputGameType: GameType, inputUserNumber: RockPaperScissors,
                      inputcomputerNumber: RockPaperScissors) {
    if inputUserNumber == inputcomputerNumber {
        printMatchResult(matchResult: .tie)
        return
    }
    
    if inputUserNumber == .scissors {
        inputcomputerNumber == .paper ?
        printMatchResult(matchResult: .win) : printMatchResult(matchResult: .lose)
    }
    
    if inputUserNumber == .paper {
        inputcomputerNumber == .rock ?
        printMatchResult(matchResult: .win) : printMatchResult(matchResult: .lose)
    }
    
    if inputUserNumber == .rock {
        inputcomputerNumber == .scissors ?
        printMatchResult(matchResult: .win) : printMatchResult(matchResult: .lose)
    }
}

func printMatchResult(matchResult: RockPaperScissorsResult) {
    switch matchResult {
    case .win:
        print("이겼습니다!")
        gameTurn = "사용자"
    case .lose:
        print("졌습니다!")
        gameTurn = "컴퓨터"
    case .tie:
        print("비겼습니다!")
    }
}

startGame()
