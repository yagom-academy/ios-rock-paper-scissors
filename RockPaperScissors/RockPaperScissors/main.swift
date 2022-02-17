//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Result: String {
    case win = "이겼습니다."
    case draw = "비겼습니다."
    case lose = "졌습니다."
    
    func printMessage() {
        print(self.rawValue)
    }
}

enum Card: String, CaseIterable {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    static let cases: [Card] = Card.allCases
    
    func compareEachCard(computerCard: Card) -> Result {
        let winCase = [[Card.scissors, Card.paper],[Card.rock, Card.scissors],[Card.paper, Card.rock]]
        let cardPair = [self, computerCard]
        if self == computerCard {
            return Result.draw
        } else if winCase.contains(cardPair) {
            return Result.win
        } else {
            return Result.lose
        }
    }
}

enum Command: String {
    case terminator = "0"
}

func inputSelectionCard() {
    printMenu()
    guard let userInput: String = readLine() else { return }
    
    if userInput == Command.terminator.rawValue {
        print("게임 종료")
        return
    }
    
    guard let userCard = Card(rawValue: userInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        inputSelectionCard()
        return
    }
    playGame(selectedCard: userCard)
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
}

func playGame(selectedCard: Card?) {
    let computerCard = makeRandomCard()
    guard let userCard: Card = selectedCard else { return }
    printResult(gameResult: userCard.compareEachCard(computerCard: computerCard))
}

func makeRandomCard() -> Card {
    let randomCard: Card = Card.cases[Int.random(in: 0..<Card.cases.count)]
    return randomCard
}

func printResult(gameResult: Result) {
    switch gameResult {
    case Result.draw:
        Result.draw.printMessage()
        inputSelectionCard()
    case Result.win:
        Result.win.printMessage()
        print("게임 종료")
    case Result.lose:
        Result.lose.printMessage()
        print("게임 종료")
    }
}

inputSelectionCard()
