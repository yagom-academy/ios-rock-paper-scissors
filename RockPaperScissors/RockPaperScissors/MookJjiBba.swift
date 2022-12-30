//
//  RockPaperScissors - MookJjiBba.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

class MookJjiBba: Game {
    var rockPaperScissorsWinner: Player?
    
    override func choiceUserNumber() -> Int? {
        guard let mookJjiBbaTurnOwner = rockPaperScissorsWinner else {
            return choiceUserNumber()
        }
    
        print("[\(mookJjiBbaTurnOwner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        return super.choiceUserNumber()
    }
    
    override func checkUserNumber(number: Int?) -> Int {
        guard let userNumber = number, userNumber >= 0, userNumber <= 3 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            rockPaperScissorsWinner = .computer
            return checkUserNumber(number: choiceUserNumber())
        }
        return userNumber
    }
    
    func playMookJjiBba(turnOwner: Player) {
        rockPaperScissorsWinner = turnOwner
        var currentTurnOwner = turnOwner
        let computerNumber = createComputerNumber()
        let userNumber = createUserNumber()
        
        guard userNumber != 0 else {
            print("게임 종료")
            return
        }
        
        guard let computerMookJjiBba = HandSign.convertNumberToHandSign(from: computerNumber,
                                                                        at: .mookJjiBba),
              let userMookJjiBba = HandSign.convertNumberToHandSign(from: userNumber,
                                                                    at: .mookJjiBba)
        else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return playMookJjiBba(turnOwner: currentTurnOwner)
        }
        
        let gameResult = GameResult.compareHandSigns(computers: computerMookJjiBba,
                                                     users: userMookJjiBba)
        
        if gameResult == .draw {
            judgeWinPlayer(turnOwner: currentTurnOwner)
        } else if gameResult == .win {
            currentTurnOwner = Player.user
            print("\(currentTurnOwner.rawValue)의 턴입니다.")
            playMookJjiBba(turnOwner: currentTurnOwner)
        } else if gameResult == .lose {
            currentTurnOwner = Player.computer
            print("\(currentTurnOwner.rawValue)의 턴입니다.")
            playMookJjiBba(turnOwner: currentTurnOwner)
        }
    }
    
    private func judgeWinPlayer(turnOwner: Player) {
        let winner = turnOwner == Player.user ? "사용자의 승리!" : "컴퓨터의 승리!"
        
        print(winner)
    }
}
