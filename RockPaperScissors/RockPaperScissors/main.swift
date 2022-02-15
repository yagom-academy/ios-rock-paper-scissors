//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
}

func startGame() {
    printMenu()
    inputSelectionCard()
}

func makeRandomCard() -> Int {
    let randomCard = Int.random(in: 1...3)
    return randomCard
}

func inputSelectionCard() {
    let userInput: String? = readLine()
    switch userInput {
    case "1", "2", "3":
        checkCard(selectedCard: userInput)
    case "0":
        print("게임 종료")
    case .none:
        print("nil")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}

func checkCard(selectedCard: String?) {
    let computerCard = makeRandomCard()
    guard let userCard = (selectedCard.flatMap{ Int($0) }) else { return }
    getGameResult(userCard: userCard, computerCard: computerCard)
}

func getGameResult(userCard: Int, computerCard: Int) {
    if userCard == computerCard {
        print("비겼습니다.")
        startGame()
    } else if (computerCard - userCard) == -1 || (computerCard - userCard) == 2 {
        print("이겼습니다.")
    } else {
        print("졌습니다.")
    }
}

startGame()
