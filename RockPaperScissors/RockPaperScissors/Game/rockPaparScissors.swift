//
//  RockPaparScissors.swift
//  RockPaperScissors
//
//  Created by 박세웅 on 2022/02/17.
//

import Foundation

class RockPaperScissors: Game {
    private var winner: String = ""
    
    func getWinner() -> String { winner }
    
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
        case .draw:
            playGame()
        case .win:
            winner = user.getName()
        case .lose:
            winner = computer.getName()
        }
    }
}
