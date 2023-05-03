//
//  MuckJjiBba.swift
//  RockPaperScissors
//
//  Created by Yeseul Jang on 2023/05/03.
//

extension RockPaperScissors {
    func GetUserMuckJjiBbaInput(when usergameResult: GameResult) {
        let gameEnd: String = "0"

        if usergameResult == .win {
            print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        } else {
            print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        }
        
        guard let userInput: String = readLine() else { return }
        checkGameEnd(userInput)
        checkVaildInput(userInput: userInput, makeComputerInput(), gameResult: usergameResult)
        
    }
    
    func checkVaildInput(userInput:String, _ computerInput: String, gameResult: GameResult) {
        switch userInput {
        case MuckJjiBbaSign.jji.rawValue,
            MuckJjiBbaSign.muck.rawValue,
            MuckJjiBbaSign.bba.rawValue:
            StartMuckJjiBbaGame(with: userInput, computerInput, gameResult: gameResult)
        default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        GetUserMuckJjiBbaInput(when: .lose)
        }
    }
   
    func StartMuckJjiBbaGame(with userInput: String, _ computerInput: String, gameResult: GameResult) {
        switch userInput {
        case computerInput where gameResult == .win:
            print("사용자 승리!")
        case computerInput where gameResult == .lose:
            print("컴퓨터 승리!")
        default:
            print("컴: \(computerInput), 유저: \(userInput), 승패: \(checkMuckJjiBbaTurn(with: userInput, computerInput))")
            GetUserMuckJjiBbaInput(when: checkMuckJjiBbaTurn(with: userInput, computerInput))
        }
    }
    
    func checkMuckJjiBbaTurn(with userInput: String, _ computerInput: String) -> GameResult {
        switch (userInput, computerInput) {
        case (MuckJjiBbaSign.jji.rawValue, MuckJjiBbaSign.bba.rawValue),
            (MuckJjiBbaSign.muck.rawValue, MuckJjiBbaSign.jji.rawValue),
            (MuckJjiBbaSign.bba.rawValue, MuckJjiBbaSign.muck.rawValue):
            return .win
        default:
            return .lose
        }
    }
}

enum MuckJjiBbaSign: String {
    case muck = "1"
    case jji = "2"
    case bba = "3"
}
