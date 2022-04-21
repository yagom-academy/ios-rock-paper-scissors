//
//  gameMessage.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

enum GameStatus {
    case menu
    case win
    case lose
    case draw
    case end
    case error
    
    func printMessage() {
        switch self {
        case .menu:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
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
