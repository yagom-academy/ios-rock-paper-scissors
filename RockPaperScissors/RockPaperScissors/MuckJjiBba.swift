//
//  MuckJjiBba.swift
//  RockPaperScissors
//
//  Created by hemg on 2023/05/03.
//

struct MuckJjiBba {
    func getUserMuckJjiBbaInput(when userGameResult: GameResult) {
        if userGameResult == .win {
            print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: "")
        } else {
            print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: "")
        }
        
        guard let userInput: String = readLine() else { return }
        //checkGameEnd(userInput)
        //checVaildInput()
    }
}
