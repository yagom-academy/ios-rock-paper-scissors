//
//  RockPaperScissors - MookJjiBba.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

class MookJjiBba: Game {
    var rockPaperScissorsWinner: Player?
    
    override func choiceUserNumber() -> Int? {
        guard let mookJjiBbaturnOwner = rockPaperScissorsWinner else {
            return choiceUserNumber()
        }
        print("[\(mookJjiBbaturnOwner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        return super.choiceUserNumber()
    }
    
    func playMookJjiBba(turnOwner: Player) {
        rockPaperScissorsWinner = turnOwner
        var currentPlayer = turnOwner
        let computerNumber = createComputerNumber()
        let userNumber = createUserNumber()
        
        guard userNumber != 0 else {
            print("게임 종료")
            return
        }
        
        guard let computerMookJjiBba = HandSign.convertNumberToHandSign(computerNumber,
                                                                    gameType: .mookJjiBba),
              let userMookJjiBba = HandSign.convertNumberToHandSign(userNumber,
                                                                gameType: .mookJjiBba)
        else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return playMookJjiBba(turnOwner: currentPlayer)
        }
        
        let gameResult = GameResult.compareHandSigns(computers: computerMookJjiBba,
                                                     users: userMookJjiBba)
        
        if gameResult == .draw {
            judgeWinPlayer(turnOwner: currentPlayer)
        } else if gameResult == .win {
            currentPlayer = Player.user
            print("\(Player.user.rawValue)의 턴입니다.")
            playMookJjiBba(turnOwner: currentPlayer)
        } else if gameResult == .lose {
            currentPlayer = Player.computer
            print("\(Player.computer.rawValue)의 턴입니다.")
            playMookJjiBba(turnOwner: currentPlayer)
        }
    }
    
    private func judgeWinPlayer(turnOwner: Player) {
        let winner = turnOwner == Player.user ? "사용자의 승리!" : "컴퓨터의 승리!"
        print(winner)
    }
}
