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
        
    mutating func setCard(selectedCard: Card) {
        //guard let userCard: Card = selectedCard else { return }
        card = selectedCard
    }
}

class Game {
    var winner: String = ""
    var user: Player
    var computer: Player
    
    init(user: Player, computer: Player){
        self.user = user
        self.computer = computer
    }
    
    func inputSelectionCard() {
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
    
    func makeRandomCard() -> Card {
        let randomCard: Card = Card.cases[Int.random(in: 0..<Card.cases.count)]
        return randomCard
    }

    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    }

    func playGame(selectedCard: Card) {
        computer.setCard(selectedCard: makeRandomCard())
        user.setCard(selectedCard: selectedCard)
        
        guard let userCard: Card = user.getCard() else { return }
        guard let computerCard: Card = computer.getCard() else { return }
        
        let resultOfCompare = userCard.compareEachCard(computerCard: computerCard)
        printResult(gameResult: resultOfCompare)
        
        
    }
    
//    func playMukChiBa(selectedCard: Card) {
//        computer.setCard(selectedCard: makeRandomCard())
//        user.setCard(selectedCard: selectedCard)
//
//        guard let userCard: Card = user.getCard() else { return }
//        guard let computerCard: Card = computer.getCard() else { return }
//
//        let resultOfCompare = userCard.compareEachCard(computerCard: computerCard)
//        printResult(gameResult: resultOfCompare)
//    }

    func printResult(gameResult: Result) {
        switch gameResult {
        case Result.draw:
            gameResult.printMessage()
            inputSelectionCard()
        case Result.win:
            winner = user.getName()
            gameResult.printMessage()
        case Result.lose:
            winner = computer.getName()
            gameResult.printMessage()
            
        }
    }
    
//    func convertValue(input: String) -> String {
//        switch input {
//        case "1": return Card.rock.rawValue
//        case "2": return Card.scissors.rawValue
//        case "3": return Card.paper.rawValue
//        default: return input
//        }
//    }
    
//    func startMukChiBa() {
//        printMenu()
//
//        guard let userInput: String = readLine() else { return }
//        if userInput == Command.terminator.rawValue {
//            print("게임 종료")
//            return
//        }
//        guard let userCard: Card = Card(rawValue: convertValue(input: userInput)) else {
//            print("잘못된 입력입니다. 다시 시도해주세요.")
//            startMukChiBa()
//            return
//        }
//        //playGame(selectedCard: userCard)
//        print(userCard.rawValue)
//    }
}

class MukChiBaGame: Game {
    var turn: String = ""
    
    func setTurn(name: String) {
        turn = name
    }
    
    override func printMenu() {
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
    }
    
    override func printResult(gameResult: Result) {
        switch gameResult {
        case Result.draw:
            print(turn + "승리")
        case Result.win:
            setTurn(name: user.getName())
            print(turn + "의 턴입니다.")
            inputSelectionCard()
        case Result.lose:
            setTurn(name: computer.getName())
            print(turn + "의 턴입니다.")
            inputSelectionCard()
        }
    }
    
    
    
    
    //게임결과 판단 기능
    //입력값 변환 묵찌바 -> 가위바위보
}

var user: Player = Player(name: "사용자")
var computer: Player = Player(name: "컴퓨터")

var newGame: Game = Game(user: user, computer: computer)

var sGame: MukChiBaGame = MukChiBaGame(user: user, computer: computer)
newGame.inputSelectionCard()
sGame.setTurn(name: newGame.winner)
sGame.inputSelectionCard()

