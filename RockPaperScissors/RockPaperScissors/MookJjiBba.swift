//
//  RockPaperScissors - MookJjiBba.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

class MookJjiBba: HandSignGame {
    override func choiceUserNumber() -> Int? {
        print("[\(turnOwner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        return super.choiceUserNumber()
    }
    
    func playMookJjiBba() {
        let computerNumber = createComputerNumber()
        let userNumber = createUserNumber()
        
        guard userNumber != 0 else {
            print("게임 종료")
            return
        }
        
        guard let computerMookJjiBba = HandSign.convertHandSignType(computerNumber, gameType: .mookJjiBba),
              let userMookJjiBba = HandSign.convertHandSignType(userNumber, gameType: .mookJjiBba) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return playMookJjiBba()
        }
        
        let gameResult = GameResult.compareHandSigns(computers: computerMookJjiBba, users: userMookJjiBba)
        
        if gameResult == .draw {
            judgeWinPlayer()
        } else if gameResult == .win {
            turnOwner = "사용자"
            print("\(turnOwner)의 턴입니다.")
            playMookJjiBba()
        } else if gameResult == .lose {
            turnOwner = "컴퓨터"
            print("\(turnOwner)의 턴입니다.")
            playMookJjiBba()
        }
    }
    
    func judgeWinPlayer() {
        let winner = turnOwner == "사용자" ? "사용자의 승리!" : "컴퓨터의 승리!"
        print(winner)
    }
}
