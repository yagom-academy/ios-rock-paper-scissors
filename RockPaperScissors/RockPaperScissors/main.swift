//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

startGame()

func startGame() {
    printRockScissorPaperMenu()
    let userInput = userInput()
    guard validateUserInputNumber(input: userInput) else {
        print("잘못된 입력입니다. 다시 시도해 주세요")
        startGame()
        return
    }
    guard let userInputNumber = makeStringToInt(userInput) else { return }
    if userInputNumber == 0 {
        print("게임 종료")
        return
    }
    let hands = setHandTypeForRockScissorPaper(userInputNumber)
    compareHandsForRockScissorPaper(from: hands)
}

func playMukZiPa(turn: Turn) {
    printMukZiPaMenu(turn: turn)
    let userInput = userInput()
    guard validateUserInputNumber(input: userInput) else {
        print("잘못된 입력입니다. 다시 시도해 주세요")
        playMukZiPa(turn: Turn.computer)
        return
    }
    guard let userInputNumber = makeStringToInt(userInput) else { return }
    if userInputNumber == 0 {
        print("게임 종료")
        return
    }
    let hands = setHandTypeForMukZiPa(userInputNumber)
    compareHandsForMukZiPa(from: hands, with: turn)
}
