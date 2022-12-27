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
    
    func compareRockPaperScissors(computers: HandSign, users: HandSign) -> GameResult {
        let computerUserRockPaperScissors: (HandSign, HandSign) = (computers, users)
        
        switch computerUserRockPaperScissors {
        case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
            print(GameResult.draw.description)
            return .draw
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
            print(GameResult.win.description)
            return .win
        case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
            print(GameResult.lose.description)
            return .lose
        }
    }
    
    func playRockPaperScissors() {
        let computerNumber = createComputerNumber()
        let userNumber = createUserNumber()
        
        guard userNumber != 0 else {
            return
        }
        
        guard let computerRockPaperScissors = convertEnumType(computerNumber),
              let userRockPaperScissors = convertEnumType(userNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return playRockPaperScissors()
        }
        
        let gameResult = compareRockPaperScissors(computers: computerRockPaperScissors, users: userRockPaperScissors)
        
        if gameResult == .draw {
            playRockPaperScissors()
        } else if gameResult == .win {
            mookJjiBba.turnOwner = "사용자"
            mookJjiBba.playMookJjiBba()
        } else {
            mookJjiBba.turnOwner = "컴퓨터"
            mookJjiBba.playMookJjiBba()
        }
    }
}
