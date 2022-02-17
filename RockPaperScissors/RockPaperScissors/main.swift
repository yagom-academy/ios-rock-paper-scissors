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
    case terminator = "0"
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
        card = selectedCard
    }
}

class Game {
    private var user: Player
    private var computer: Player
    
    init(user: Player, computer: Player){
        self.user = user
        self.computer = computer
    }
    
    func playGame() { }
    
    func inputCard() -> Card? {
        guard let userCard: String = readLine() else { return nil }
        return Card(rawValue: userCard)
    }
    
    func makeRandomCard() -> Card {
        let randomCard: Card = Card.cases[Int.random(in: 1..<Card.cases.count)]
        return randomCard
    }
    
    func printMenu() { }
    
    func openCard(selectedCard: Card) {
        computer.setCard(selectedCard: makeRandomCard())
        user.setCard(selectedCard: selectedCard)
        
        guard let userCard: Card = user.getCard() else { return }
        guard let computerCard: Card = computer.getCard() else { return }
        
        let resultOfCompare = userCard.compareEachCard(computerCard: computerCard)
        printResult(gameResult: resultOfCompare)
    }
    
    func printResult(gameResult: Result) { }
}

class RockPaperScissors: Game {
    private var winner: String = ""
    
    func gatWinner() -> String { winner }
    
    override func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    }
    
    override func playGame() {
        printMenu()
        guard let userCard = inputCard() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            playGame()
            return
        }
        if userCard == Card.terminator {
            print("게임 종료")
            return
        }
        openCard(selectedCard: userCard)
    }
    
    override func printResult(gameResult: Result) {
        gameResult.printMessage()
        switch gameResult {
        case Result.draw:
            playGame()
        case Result.win:
            winner = user.getName()
        case Result.lose:
            winner = computer.getName()
        }
    }
}

class MukChiBa: Game {
    var turnPlayerName: String = ""
    
    func setTurn(name: String) {
        turnPlayerName = name
    }
    
    override func printMenu() {
        print("[\(turnPlayerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
    }
    
    override func printResult(gameResult: Result) {
        switch gameResult {
        case Result.draw:
            print("\(turnPlayerName)의 승리!")
            print("게임 종료")
        default:
            decideTurn(gameResult: gameResult)
            playGame()
        }
    }
    
    override func playGame() {
        printMenu()
        guard let userCard = inputCard() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            setTurn(name: computer.getName())
            playGame()
            return
        }
        if userCard == Card.terminator {
            print("게임 종료")
            return
        }
        openCard(selectedCard: convertCard(input: userCard))
    }
    
    private func decideTurn(gameResult: Result) {
        gameResult == Result.win ? setTurn(name: user.getName()) : setTurn(name: computer.getName())
        print("\(turnPlayerName)의 턴입니다.")
    }
    
    private func convertCard(input: Card) -> Card {
        switch input {
        case Card.scissors: return Card.rock
        case Card.rock: return Card.scissors
        default: return input
        }
    }
}

var user: Player = Player(name: "사용자")
var computer: Player = Player(name: "컴퓨터")
var rockPaperScissorsGame: RockPaperScissors = RockPaperScissors(user: user, computer: computer)
var mukChiBaGame: MukChiBa = MukChiBa(user: user, computer: computer)
rockPaperScissorsGame.playGame()
mukChiBaGame.setTurn(name: rockPaperScissorsGame.gatWinner())
mukChiBaGame.playGame()

