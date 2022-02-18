import Foundation

enum StartAndEndMessage {
    static let startOfFirstGame = "가위(1), 바위(2), 보(3)! <종료 : 0>"
    static let startOfSecondGame = "묵(1), 찌(2), 빠(3)! <종료 : 0>"
    static let endOfGame = "게임 종료"
}

enum ErrorMessage {
    static let wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
}

enum GameResultMessage {
    static let win = "이겼습니다!"
    static let defeat = "졌습니다!"
    static let draw = "비겼습니다!"
}

enum PunctuationMarks {
    static let colon = " : "
    static let emptyString = ""
}

enum Decision {
    static let winNumber = [1, -2]
    static let defeatNumber = [2, -1]
}

enum Player {
    static let user = "사용자"
    static let computer = "컴퓨터"
}

var isTurnOfUser: Bool = false
var thisTurn: String = PunctuationMarks.emptyString

func decideTurn() -> String {
    if isTurnOfUser == true {
        return Player.user
    } else {
        return Player.computer
    }
}

let rockPaperScissors = RockPaperScissors()
let mukjipa = MukJiPa()
rockPaperScissors.startGame(rockPaperScissors.selectGameMenu())
