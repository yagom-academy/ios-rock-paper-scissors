//
//  RockPaperScissors - RockPaperScissors.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

class RockPaperScissors: Game {
    override func choiceUserNumber() -> Int? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        return super.choiceUserNumber()
    }
    
    func RockPaperScissors(mookJjiBba: MookJjiBba) {
        let computerNumber = createComputerNumber()
        let userNumber = createUserNumber()
        
        guard userNumber != 0 else {
            print("게임 종료")
            return
        }
        
        guard let computerRockPaperScissors = HandSign.convertNumberToHandSign(computerNumber,
                                                                           gameType: .rockPaperScissors),
              let userRockPaperScissors = HandSign.convertNumberToHandSign(userNumber,
                                                                       gameType: .rockPaperScissors)
        else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return RockPaperScissors(mookJjiBba: mookJjiBba)
        }
        
        let gameResult = GameResult.compareHandSigns(computers: computerRockPaperScissors,
                                                     users: userRockPaperScissors)
        
        if gameResult == .draw {
            print("비겼습니다!")
            RockPaperScissors(mookJjiBba: mookJjiBba)
        } else if gameResult == .win {
            print("이겼습니다!")
            mookJjiBba.turnOwner = .user
        } else if gameResult == .lose {
            print("졌습니다")
            mookJjiBba.turnOwner = .computer
        }
    }
}
