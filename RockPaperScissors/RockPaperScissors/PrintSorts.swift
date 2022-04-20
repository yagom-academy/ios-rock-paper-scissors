//
//  Print.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/20.
//

struct PrintSorts {
    func printMukjipaMenu(by turn: Turn) {
        print("[\(turn.turnResult) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }

    func printResult(of result: GameResult) {
        print(result.message)
    }
    
    func printRockScissorsPaperMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func printInvalidResult() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    func printEndGame() {
        print("게임 종료")
    }
    
}
