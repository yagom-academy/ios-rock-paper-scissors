
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
/// 배열의 첫번째 값은 패가 같은 경우에는 true, 패가 다른 경우에는 false
/// 배열의 두번째 값은 사용자 턴인 경우엔 true, 컴퓨터 턴인 경우에는 false
func step2_1(turnState: Int, userNumber: Int, computerNumber: Int) -> [Bool] {
    if userNumber == computerNumber {
        if turnState == 1 {
            print("사용자의 승리!")
        } else {
            print("컴퓨터의 승리!")
        }
        return [true]
    } else {
        if turnState == 1 {
            return [false, true]
        } else {
            return [false, false]
        }
    }
}

/// 반환값이 true인 경우 게임 종료
/// 반환값이 false인 경우 반복
func step2(state: Int) -> Bool {
    resetFlag = true
    var turn: String = ""
    var turnState: Int = state
    var isContinue: Bool = true
    while isContinue {
        if turnState == 1 {
            turn = "사용자 턴"
        } else {
            turn = "컴퓨터 턴"
        }
        if resetFlag {
            computerNumber = Int.random(in: 1...3)
            resetFlag = false
        }
        print("[\(turn)] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        let userInput: Int? = Int(readLine()!)
        guard let userNumber = userInput else {
            if turnState == 1 {
                turnState = 0
            } else {
                turnState = 1
            }
            continue
        }
        guard userNumber >= 1 && userNumber <= 3 else {
            if turnState == 1 {
                turnState = 0
            } else {
                turnState = 1
            }
            continue
        }
        let gameResult: [Bool] = step2_1(turnState: turnState, userNumber: userNumber, computerNumber: computerNumber)
        /// 패가 같은 경우
        if gameResult[0] {
            return true
        } else {
            
        }
    }
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
            
        } else if gameResult == lose {
            print("졌습니다!")
            
        } else {
            print("비겼습니다!")
            resetFlag = true
        }
    }
}

startGame()
