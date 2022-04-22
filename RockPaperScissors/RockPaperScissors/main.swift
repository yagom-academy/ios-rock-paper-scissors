//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
var user = Player(playerName: "사용자")
var computer = Player(playerName: "컴퓨터")

func startRockPaperScissorGame() {
    let computerRockPaperScissorInput = makeComputerRandomNumber()
    while true {
        printRockPaperScissorOption()
        let userRockPaperScissorInput = inputUserNumber()
        if userRockPaperScissorInput == ExceptionalInput.wrongInput.correspondingNumber {
            printErrorMessage()
            continue
        }
        if userRockPaperScissorInput == ExceptionalInput.closeInput.correspondingNumber{
            print("게임 종료")
            break
        }
        let comparedResult = compareTwoNumbers(userInput: userRockPaperScissorInput, computerInput: computerRockPaperScissorInput, winningNumberCase: winnigCases.RockPaperScissorCase.numberCases)
        print(comparedResult)
        if comparedResult == GameResult.draw.result {
            continue
        }
        comparedResult == GameResult.win.result ? user.MuckJjiPpaTurnChange() : computer.MuckJjiPpaTurnChange()
        startMuckJjiPpaGame()
        break
    }
}

func startMuckJjiPpaGame() {
    while true {
        let currentWinner = user.MuckJjiPpaTurn ? user : computer
        printMuckJjiPpaOption(player: currentWinner)
        let computerMuckJjiPpaInput = makeComputerRandomNumber()
        let userMuckJjiPpaInput = inputUserNumber()
        if userMuckJjiPpaInput == ExceptionalInput.closeInput.correspondingNumber{
            print("게임 종료")
            break
        }
        if currentWinner.playerName == user.playerName && userMuckJjiPpaInput == ExceptionalInput.wrongInput.correspondingNumber {
            printErrorMessage()
            doTurnChange()
            continue
        } else if currentWinner.playerName == computer.playerName && userMuckJjiPpaInput == ExceptionalInput.wrongInput.correspondingNumber {
            printErrorMessage()
            continue
        }
        let matchResult = compareTwoNumbers(userInput: userMuckJjiPpaInput, computerInput: computerMuckJjiPpaInput, winningNumberCase: winnigCases.MuckJjiPpaCase.numberCases)
        if matchResult == GameResult.draw.result {
            print("\(currentWinner.playerName)의 승리!")
            print("게임 종료")
            break
        } else if currentWinner.playerName == user.playerName && matchResult == GameResult.lose.result {
            doTurnChange()
            print("컴퓨터의 턴입니다")
        } else if currentWinner.playerName == computer.playerName && matchResult == GameResult.win.result {
            doTurnChange()
            print("사용자의 턴입니다")
        }
    }
}

startRockPaperScissorGame()
