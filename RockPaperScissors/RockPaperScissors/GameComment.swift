//  Created by 감자 and som on 2022/08/22.

enum GameComment: String {
    case retry = "잘못된 입력입니다. 다시 시도해주세요."
    case gameWin = "이겼습니다!"
    case gameLose = "졌습니다!"
    case gameDraw = "비겼습니다!"
    case gameMenu = "가위(1), 바위(2), 보(3)! <종료 : 0>: "
    case none = "입력된 값이 없습니다."
    case gameOver = "게임 종료"
}
