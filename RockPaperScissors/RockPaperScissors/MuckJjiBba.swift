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
        checkGameEnd(userInput)
        //checkVaildInput()
    }
    
    private func checkGameEnd(_ userInput: String) {
        guard userInput != "0" else { return print("게임 종료") }
    }
    
    private func makeComputerInput() -> String {
        return String(Int.random(in: 1...3))
    }
    
    private func checkVaildInput(with userInput: String, _ computerInput: String, _ gameResult: GameResult) {
        switch userInput {
        case MuckJjiBbaSign.jji.rawValue,
            MuckJjiBbaSign.muck.rawValue,
            MuckJjiBbaSign.bba.rawValue:
            //검증 함수
            break
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            getUserMuckJjiBbaInput(when: .lose)
        }
    }
    
    
}
