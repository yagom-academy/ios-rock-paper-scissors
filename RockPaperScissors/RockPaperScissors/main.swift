//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Result {
    static let win = "이겼습니다."
    static let draw = "비겼습니다."
    static let lose = "졌습니다."
}

enum Card: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    static let cases: [Card] = [.scissors, .rock, .paper]
}

enum Command: String {
    case terminator = "0"
}

func inputSelectionCard() {
    printMenu()
    let userInput: String? = readLine()
    switch userInput {
    case Card.scissors.rawValue:
        playGame(selectedCard: Card.scissors)
    case Card.rock.rawValue:
        playGame(selectedCard: Card.rock)
    case Card.paper.rawValue:
        playGame(selectedCard: Card.paper)
    case Command.terminator.rawValue:
        print("게임 종료")
    case .none:
        print("nil")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        inputSelectionCard()
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
}

func playGame(selectedCard: Card?) {
    guard let computerCard: Card = makeRandomCard() else { return }
    guard let userCard: Card = selectedCard else { return }
    printResult(gameResult: compareEachCard(userCard: userCard, computerCard: computerCard))
}

func makeRandomCard() -> Card? {
    let randomCard: Card = Card.cases[Int.random(in: 0..<Card.cases.count)]
    return randomCard
}

func printResult(gameResult: String) {
    switch gameResult {
    case Result.draw:
        print(Result.draw)
        inputSelectionCard()
    case Result.win:
        print(Result.win)
        print("게임 종료")
    case Result.lose:
        print(Result.lose)
        print("게임 종료")
    default: return
    }
    
}

func compareEachCard(userCard: Card, computerCard: Card) -> String {
    let winCase = [[Card.scissors, Card.paper],[Card.rock, Card.scissors],[Card.paper, Card.rock]]
    let cardPair = [userCard, computerCard]
    if userCard == computerCard {
        return Result.draw
    } else if winCase.contains(cardPair) {
        return Result.win
    } else {
        return Result.lose
    }
}

inputSelectionCard()
