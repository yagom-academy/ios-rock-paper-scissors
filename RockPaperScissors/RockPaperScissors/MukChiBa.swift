//
//  MukChiBa.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

class MukChiba: RockPaperScissors {

    override func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int) {
        let differenceNumber: GameJudgment = makeResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            print(GameJudgment.win.message)
            startMukChiBa(attackTurn: .user)
        case .lose:
            print(GameJudgment.lose.message)
            startMukChiBa(attackTurn: .computer)
        default:
            print(GameJudgment.draw.message)
            startGame()
        }
    }
    
    fileprivate func startMukChiBa(attackTurn: Turn) {
        attackTurn.displayTurn()
        GameText.start.displayMessage()
        guard let inputtedUserNumber: Int = Int(bindUserInput()) else {
            GameText.caution.displayMessage()
            startMukChiBa(attackTurn: .computer)
            return
        }
        playMukChiba(inputtedUserNumber, attackTurn)
    }
    
    fileprivate func playMukChiba(_ userNumber: Int, _ attackTurn: Turn) {
        switch selectOption(userNumber) {
        case .exit:
            print(GameOver.exit.message)
        case .play:
            compareNumbers(makeComputerNumber(), userNumber, attackTurn)
        default:
            GameText.caution.displayMessage()
            startMukChiBa(attackTurn: .computer)
        }
    }
    
    fileprivate func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int, _ turn: Turn) {
        let differenceNumber: GameJudgment = makeResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            startMukChiBa(attackTurn: .user)
        case .lose:
            startMukChiBa(attackTurn: .computer)
        default:
            if turn == .user {
                print(GameOver.userWin.message)
            } else {
                print(GameOver.computerWin.message)
            }
        }
    }
}
