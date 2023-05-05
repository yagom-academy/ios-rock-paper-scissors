//
//  MuckJjiBba.swift
//  RockPaperScissors
//
//  Created by yyss99, Hemg on 2023/05/03.
//

struct MuckJjiBba {
    
    func startGame(_ gameResult: GameResult) {
        showMuckJjiBbaGameMenu(gameResult)
        
        guard let userInput = readLine(),
              validate(userInput) else { return }
        
        guard let userMuckJjiBbaSign = MuckJjiBbaSign(rawValue: userInput) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame(.lose)
            return
        }
        let computerMuckJjiBbaSign = makeComputerMuckJjiBbaSign()
        checkMuckJjiBbaGameResult(userMuckJjiBbaSign, computerMuckJjiBbaSign, gameResult)
    }
    
    private func showMuckJjiBbaGameMenu(_ gameResult: GameResult) {
        print("[\(gameResult.rawValue)의 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
    }
    
    private func validate(_ userInput: String) -> Bool {
        return userInput != "0"
    }
    
    private func makeComputerMuckJjiBbaSign() -> MuckJjiBbaSign {
        return MuckJjiBbaSign.allCases[Int.random(in: 0...2)]
    }
    
    private func checkMuckJjiBbaGameResult(_ userInput: MuckJjiBbaSign, _ computerInput: MuckJjiBbaSign, _ gameResult: GameResult) {
        if userInput == computerInput {
            print("\(gameResult.rawValue) 승리!")
        } else {
            startGame(changeMuckJjiBbaTurn(userInput, computerInput))
        }
    }
    
    private func changeMuckJjiBbaTurn(_ userInput: MuckJjiBbaSign, _ computerInput: MuckJjiBbaSign) -> GameResult {
        if (userInput == .jji && computerInput == .bba) ||
            (userInput == .muck && computerInput == .jji) ||
            (userInput == .bba && computerInput == .muck) {
            showPlayerTurn(.win)
            return .win
        } else {
            showPlayerTurn(.lose)
            return .lose
        }
    }
    
    private func showPlayerTurn(_ gameResult: GameResult){
        print("\(gameResult.rawValue)의 턴")
    }
}
