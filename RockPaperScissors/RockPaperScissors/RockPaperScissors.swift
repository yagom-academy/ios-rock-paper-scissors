//
//  RockPaperScissors - RockPaperScissors.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

class RockPaperScissors: HandSignGame {
    var mookJjiBba: MookJjiBba = MookJjiBba()
    
    override func choiceUserNumber() -> Int? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        return super.choiceUserNumber()
    }
    
    func playRockPaperScissors() {
        let computerNumber = createComputerNumber()
        let userNumber = createUserNumber()
        
        guard userNumber != 0 else {
            print("게임 종료")
            return
        }
        
        guard let computerRockPaperScissors = HandSign.convertHandSignType(computerNumber, gameType: .rockPaperScissors),
              let userRockPaperScissors = HandSign.convertHandSignType(userNumber, gameType: .rockPaperScissors) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return playRockPaperScissors()
        }
        
        let gameResult = GameResult.compareHandSigns(computers: computerRockPaperScissors, users: userRockPaperScissors)
        
        if gameResult == .draw {
            print("비겼습니다!")
            playRockPaperScissors()
        } else if gameResult == .win {
            print("이겼습니다!")
            mookJjiBba.turnOwner = "사용자"
            mookJjiBba.playMookJjiBba()
        } else if gameResult == .lose {
            print("졌습니다")
            mookJjiBba.turnOwner = "컴퓨터"
            mookJjiBba.playMookJjiBba()
        }
    }
}
