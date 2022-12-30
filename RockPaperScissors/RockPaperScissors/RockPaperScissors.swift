//
//  RockPaperScissors - RockPaperScissors.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

class RockPaperScissors: Game {
    var gameResult: GameResult?
    
    override func choiceUserNumber() -> Int? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        return super.choiceUserNumber()
    }
    
    func playRockPaperScissors() -> GameStatus {
        let computerNumber = createComputerNumber()
        let userNumber = createUserNumber()
        
        guard userNumber != 0 else {
            print("게임 종료")
            return .stop
        }
        
        guard let computerRockPaperScissors = HandSign.convertNumberToHandSign(from: computerNumber,
                                                                               at: .rockPaperScissors),
              let userRockPaperScissors = HandSign.convertNumberToHandSign(from: userNumber,
                                                                           at: .rockPaperScissors)
        else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return playRockPaperScissors()
        }
        
        gameResult = GameResult.compareHandSigns(computers: computerRockPaperScissors,
                                                 users: userRockPaperScissors)
        return .go
    }
}

