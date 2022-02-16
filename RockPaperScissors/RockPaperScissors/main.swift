//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Result: Int {
    case win = 1
    case draw = 0
    case lose = -1
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

struct Player {
    private let name: String
    private var card: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func getCard() -> Int {
        return card
    }
    
    func getName() -> String {
        return name
    }
    
    func makeRandomCard() -> String? {
        let randomCard: Card = Card.cases[Int.random(in: 0..<Card.cases.count)]
        return randomCard.rawValue
    }
    
    mutating func setRandomCard() {
        guard let randomCard: Int = (makeRandomCard().flatMap{ Int($0) }) else { return }
        card = randomCard
    }
    
    mutating func setCardFromInput(selectedCard: String?) {
        guard let userCard: Int = (selectedCard.flatMap{ Int($0) }) else { return }
        card = userCard
    }
}

struct Game {
    var user: Player
    var computer: Player
    var turn: String
    
    mutating func inputSelectionCard() {
        printMenu()
        let userInput: String? = readLine()
        switch userInput {
        case Card.scissors.rawValue, Card.rock.rawValue, Card.paper.rawValue:
            playGame(selectedCard: userInput)
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
        if turn.isEmpty {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        } else {
            print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
        }
    }

    mutating func playGame(selectedCard: String?) {
        computer.setRandomCard()
        user.setCardFromInput(selectedCard: selectedCard)
        printResult(gameResult: compareEachCard(userCard: user.getCard(), computerCard: computer.getCard()))
    }
    
    mutating func playMukChiBa(selectedCard: String?) {
        computer.setRandomCard()
        user.setCardFromInput(selectedCard: selectedCard)
        printResult(gameResult: compareEachCard(userCard: user.getCard(), computerCard: computer.getCard()))
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

    func compareEachCard(userCard: Int, computerCard: Int) -> Result {
        if userCard == computerCard {
            return Result.draw
        } else if (computerCard - userCard) == -1 || (computerCard - userCard) == 2 {
            return Result.win
        } else {
            return Result.lose
        }
    }
    
    func convertValue(input: String?) -> String? {
        switch input {
        case "1": return Card.rock.rawValue
        case "2": return Card.scissors.rawValue
        case "3": return Card.paper.rawValue
        default: return nil
        }
    }
    
    mutating func startMukChiBa() {
        printMenu()
        let userInput: String? = readLine()
        switch userInput {
        case Card.scissors.rawValue, Card.rock.rawValue, Card.paper.rawValue:
            playGame(selectedCard: convertValue(input: userInput))
        case Command.terminator.rawValue:
            print("게임 종료")
        case .none:
            print("nil")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            turn = computer.getName()
            startMukChiBa()
        }
    }
}

var user: Player = Player(name: "사용자")
var computer: Player = Player(name: "컴퓨터")

var newGame: Game = Game(user: user, computer: computer, turn: "")
newGame.inputSelectionCard()
