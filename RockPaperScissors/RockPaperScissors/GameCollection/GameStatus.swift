//
//  gameMessage.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

enum GameStatus {
    case rockPaperScissorsMenu
    case userTurnMukChibaMenu
    case computerTurnMukChibaMenu
    case userTurn
    case computerTurn
    case userWin
    case computerWin
    case win
    case lose
    case draw
    case end
    case error
    
    func printMessage() {
        switch self {
        case .rockPaperScissorsMenu:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        case .userTurnMukChibaMenu:
            print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        case .computerTurnMukChibaMenu:
            print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        case .userTurn:
            print("사용자의 턴입니다")
        case .computerTurn:
            print("컴퓨터의 턴입니다")
        case .userWin:
            print("사용자의 승리!")
        case .computerWin:
            print("컴퓨터의 승리!")
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        case .end:
            print("게임 종료")
        case .error:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}
