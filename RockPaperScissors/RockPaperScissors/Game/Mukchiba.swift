
//
//  mukchiba.swift
//  RockPaperScissors
//
//  Created by 박세웅 on 2022/02/17.
//

import Foundation


class MukChiBa: Game {
    var turnPlayerName: String = ""
    
    func setTurn(name: String) {
        turnPlayerName = name
    }
    
    override func printMenu() {
        super.printMenu()
        print("[\(turnPlayerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
    }
    
    override func printResult(gameResult: Result) {
        switch gameResult {
        case .victory:
            print("\(turnPlayerName)의 \(gameResult.rawValue)!")
            print("게임 종료")
        default:
            decideTurn(gameResult: gameResult)
            playGame()
        }
    }
    
    override func playGame() {
        if turnPlayerName.isEmpty {
            return
        }
        printMenu()
        guard let userCard = inputCard() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            setTurn(name: computer.getName())
            playGame()
            return
        }
        if userCard == .terminator {
            print("게임 종료")
            return
        }
        openCard(selectedCard: convertCard(input: userCard))
    }
    
    override func compareCard(userCard: Card, computerCard: Card) {
        let resultOfCompare = userCard.compareEachCard(computerCard: computerCard, mode: GameMode.묵찌빠)
        printResult(gameResult: resultOfCompare)
    }
    
    private func decideTurn(gameResult: Result) {
        gameResult == Result.win ? setTurn(name: user.getName()) : setTurn(name: computer.getName())
        print("\(turnPlayerName)의 턴입니다.")
    }
    
    private func convertCard(input: Card) -> Card {
        switch input {
        case .scissors:
            return .rock
        case .rock:
            return .scissors
        default:
            return input
        }
    }
}
