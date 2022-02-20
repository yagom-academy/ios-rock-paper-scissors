import Foundation

struct Messages {
    enum ResultMessage {
        static let win = "이겼습니다!"
        static let defeat = "졌습니다!"
        static let draw = "비겼습니다!"
        static let turn = "의 턴입니다"
        static let victoryOfThisTurn = "의 승리!"
    }
    
    enum ErrorMessage {
        static let wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    }
    
    enum StartAndEndMessage {
        static let startOfFirstGame = "가위(1), 바위(2), 보(3)! <종료 : 0>"
        static let startOfSecondGame = "묵(1), 찌(2), 빠(3)! <종료 : 0>"
        static let endOfGame = "게임 종료"
    }
    
}

