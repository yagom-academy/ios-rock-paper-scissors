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
