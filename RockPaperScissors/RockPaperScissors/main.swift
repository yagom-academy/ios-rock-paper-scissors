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

struct Player {
    private let name: String
    private var card: Card?
    
    init(name: String) {
        self.name = name
    }
    
    func getCard() -> Card? {
        return card
    }
    
    func getName() -> String {
        return name
    }
    
    func makeRandomCard() -> Card {
        let randomCard: Card = Card.cases[Int.random(in: 0..<Card.cases.count)]
        return randomCard
    }
    
    mutating func setRandomCard() {
        let randomCard: Card = makeRandomCard()
        card = randomCard
    }
    
    mutating func setCardFromInput(selectedCard: Card) {
        //guard let userCard: Card = selectedCard else { return }
        card = selectedCard
    }
}

struct Game {
    var user: Player
    var computer: Player
    var turn: String
    
    mutating func inputSelectionCard() {
        printMenu()
        guard let userInput: String = readLine() else { return }
        if userInput == Command.terminator.rawValue {
            print("게임 종료")
            return
        }
        guard let userCard: Card = Card(rawValue: userInput) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            inputSelectionCard()
            return
        }
        playGame(selectedCard: userCard)
    }

    func printMenu() {
        if turn.isEmpty {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        } else {
            print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
        }
    }

    mutating func playGame(selectedCard: Card) {
        computer.setRandomCard()
        user.setCardFromInput(selectedCard: selectedCard)
        
        guard let userCard: Card = user.getCard() else { return }
        guard let computerCard: Card = computer.getCard() else { return }
        
        let resultOfCompare = userCard.compareEachCard(computerCard: computerCard)
        printResult(gameResult: resultOfCompare)
    }
    
    mutating func playMukChiBa(selectedCard: Card) {
        computer.setRandomCard()
        user.setCardFromInput(selectedCard: selectedCard)
        
        guard let userCard: Card = user.getCard() else { return }
        guard let computerCard: Card = computer.getCard() else { return }
        
        let resultOfCompare = userCard.compareEachCard(computerCard: computerCard)
        printResult(gameResult: resultOfCompare)
    }

    mutating func printResult(gameResult: Result) {
        switch gameResult {
        case Result.draw:
            print("비겼습니다.")
            inputSelectionCard()
        case Result.win:
            print("이겼습니다.")
            turn = user.getName()
            startMukChiBa()
        case Result.lose:
            print("졌습니다.")
            turn = computer.getName()
            startMukChiBa()
        }
    }
    
    func convertValue(input: String) -> String {
        switch input {
        case "1": return Card.rock.rawValue
        case "2": return Card.scissors.rawValue
        case "3": return Card.paper.rawValue
        default: return input
        }
    }
    
    mutating func startMukChiBa() {
        printMenu()
        
        guard let userInput: String = readLine() else { return }
        if userInput == Command.terminator.rawValue {
            print("게임 종료")
            return
        }
        guard let userCard: Card = Card(rawValue: convertValue(input: userInput)) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startMukChiBa()
            return
        }
        //playGame(selectedCard: userCard)
        print(userCard.rawValue)
    }
}

var user: Player = Player(name: "사용자")
var computer: Player = Player(name: "컴퓨터")

var newGame: Game = Game(user: user, computer: computer, turn: "")
newGame.inputSelectionCard()
