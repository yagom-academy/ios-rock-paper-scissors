//
//  RockPaperScissors - MookJjiBba.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

class MookJjiBba: HandSignGame {
    override func choiceUserNumber() -> Int? {
        print("[\(turnOwner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        return super.choiceUserNumber()
    }
    
    func compareMookJjiBba(computers: HandSign, users: HandSign) -> GameResult {
        let computerUserMookJjiBba: (HandSign, HandSign) = (computers, users)
        
        switch computerUserMookJjiBba {
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
    
    func playMookJjiBba() {
        let computerNumber = createComputerNumber()
        let userNumber = createUserNumber()
        
        guard userNumber != 0 else {
            return
        }
        
        guard let computerMookJjiBba = convertEnumType(computerNumber),
              let userMookJjiBba = convertEnumType(userNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return playMookJjiBba()
        }
        
        let gameResult = compareMookJjiBba(computers: computerMookJjiBba, users: userMookJjiBba)
        
        if gameResult == .draw {
            print("비김")
            playMookJjiBba()
        } else if gameResult == .win {
            print("이김")
            playMookJjiBba()
        } else if gameResult == .lose {
            print("짐")
            playMookJjiBba()
        }
    }
}
