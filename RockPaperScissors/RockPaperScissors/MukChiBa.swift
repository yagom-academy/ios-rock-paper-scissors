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
            print(GameJudgment.win.rawValue)
            startMukChiBa(attackTurn: .user)
        case .lose:
            print(GameJudgment.lose.rawValue)
            startMukChiBa(attackTurn: .computer)
        default:
            print(GameJudgment.draw.rawValue)
            startGame()
        }
    }
    
    fileprivate func startMukChiBa(attackTurn: Turn) {
//        let turn: String = attackTurn == .user ? "[사용자 턴]" : "[컴퓨터 턴]"
        print("\(attackTurn) \(GameText.start.rawValue)", terminator: "")
        guard let inputtedUserNumber: Int = Int(bindUserInput()) else {
            print(GameText.caution.rawValue)
            startMukChiBa(attackTurn: .computer)
            return
        }
        playMukChiba(inputtedUserNumber, attackTurn)
    }
    
    fileprivate func playMukChiba(_ userNumber: Int, _ attackTurn: Turn) {
        switch selectOption(userNumber) {
        case .exit:
            print(GameOver.exit.rawValue)
        case .play:
            compareNumbers(makeComputerNumber(), userNumber, attackTurn)
        default:
            print(GameText.caution.rawValue)
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
                print(GameOver.userWin.rawValue)
            } else {
                print(GameOver.computerWin.rawValue)
            }
        }
    }
}
