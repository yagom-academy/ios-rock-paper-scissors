
import Foundation

var resetFlag: Bool = true
var computerNumber: Int = 0
let win: Int = 1
let draw: Int = 0
let lose: Int = -1

func rockPaperScissorResult(userNumber:Int, computerNumber: Int) -> Int {
    var result: Int = 0
    if userNumber == computerNumber {
        result = draw
    } else if (userNumber % computerNumber) == 1 || (userNumber == computerNumber + 1) {
        result = win
    } else {
        result = lose
    }
    return result
}

func startGame() {
    var isContinue: Bool = true
    var gameResult : Int = 0
    while isContinue {
        if resetFlag {
            computerNumber = Int.random(in: 1...3)
            resetFlag = false
        }
        print(computerNumber)
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let userInput: Int? = Int(readLine()!)
        guard let userNumber = userInput else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        if userNumber == 0 {
            print("게임 종료")
            return
        }
        guard userNumber >= 1 && userNumber <= 3 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        gameResult = rockPaperScissorResult(userNumber: userNumber, computerNumber: computerNumber)
        if gameResult == win {
            print("이겼습니다!")
            return
        } else if gameResult == lose {
            print("졌습니다!")
            return
        } else {
            print("비겼습니다!")
            resetFlag = true
        }
    }
}

startGame()
