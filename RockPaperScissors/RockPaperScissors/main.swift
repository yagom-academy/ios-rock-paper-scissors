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
    var turn: String
    
    func inputSelectionCard() {
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
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    }

    func playGame(selectedCard: String?) {
        guard let computerCard: Int = (makeRandomCard().flatMap{ Int($0) }) else { return }
        guard let userCard: Int = (selectedCard.flatMap{ Int($0) }) else { return }
        printResult(gameResult: compareEachCard(userCard: userCard, computerCard: computerCard))
    }


    func printResult(gameResult: Result) {
        switch gameResult {
        case Result.draw:
            print("비겼습니다.")
            inputSelectionCard()
        case Result.win:
            print("이겼습니다.")
            print("게임 종료")
        case Result.lose:
            print("졌습니다.")
            print("게임 종료")
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
    
    func convertValue(input: String) -> String? {
        switch input {
        case "1": return "2"
        case "2": return "1"
        case "3": return "3"
        default: return nil
        }
        
    }
    
}




