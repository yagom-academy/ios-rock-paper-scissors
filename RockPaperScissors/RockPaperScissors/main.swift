//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

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
    guard let hands = setHandType(userInputNumber) else {
        print("게임 종료")
        return
    }
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
    guard let hands = setHandType(userInputNumber) else { return }
    compareHandsForMGP(from: hands, with: turn)
}
