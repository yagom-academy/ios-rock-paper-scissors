//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
/*
 가위바위보를 직관적으로 보이게 하기 위해 열거형 사용
 code by kkomal
 */
enum RockPaperScissors : Int {
    case Scissors = 1
    case Rock = 2
}

/*
 묵찌빠를 직관적으로 보이게 하기 위해 열거형 사용
 code by kkomal
 */
enum mukChiPa : Int {
    case Muk = 1
    case Chi = 2
}

/*
게임 시작할 때 최초로 출력해주는 함수
code by jake
*/

func printRockPaperScissors() {
    print("가위(1).바위(2).보(3)! <종료 : 0> : ", terminator:"")
}

/*
 가위 바위 보 승부를 판단하는 함수
 computer와 user 모두 입력은 1,2,3만 들어오는 것을 가정하고 코드 작성
 즉, 0이나 4이상의 숫자에 대한 예외처리는 입력 받을 때 처리 되어야할 것 같다.
 code by jake
 */
func judgmentWinDrawLose(computerHand : Int, userHand : Int) -> String {
    var result : String = "승패를 판단하지 못했습니다. 오류입니다."
    let Scissors = RockPaperScissors.Scissors.rawValue
    let Rock = RockPaperScissors.Rock.rawValue
    switch computerHand {
    case Scissors :
        if userHand == Scissors { print("비겼습니다!"); result = "비겼습니다!" }
        else if userHand == Rock { print("이겼습니다!"); result = "이겼습니다!" }
        else { print("졌습니다!"); result = "졌습니다!" }
    case Rock :
        if userHand == Scissors { print("졌습니다!"); result = "졌습니다!" }
        else if userHand == Rock { print("비겼습니다!"); result = "비겼습니다!" }
        else { print("이겼습니다!"); result = "이겼습니다!" }
    default :
        if userHand == Scissors { print("이겼습니다!"); result = "이겼습니다!" }
        else if userHand == Rock { print("졌습니다!"); result = "졌습니다!" }
        else { print("비겼습니다!"); result = "비겼습니다!" }
    }
    return result
}

/*
 컴퓨터의 패를 정해주는 함수
 난수를 통해서 1~3중 하나의 값을 갖는다
 code by kkomal
 */
func createComputerRockPaperScissors() -> Int {
    let computerNumber = Int.random(in : 1...3)
    return computerNumber
}

/*
 사용자에게 입력받는 함수
 code by kkomal
 */
func inputRockPaperScissors() -> String {
    // 입력값이 nil이 되는 경우 종료시켜준다.
    guard let input = readLine() else { print("입력하지 않아서 종료합니다."); return "0" }
    return input
}

/*
 사용자에게 입력받은 값을 확인하는 함수
 -1, 0, 1, 2, 3 중 하나를 반환한다
 code by kkomal
 */
func verifyInput(userInput : String) -> Int {
    var userNumber = Int(userInput) ?? -1 // 숫자가 아닌 값이면 -1로 변환
    if userNumber > 3 || userNumber < 0 {
        userNumber = -1
    }
    return userNumber
}

/*
 가위 바위 보 게임을 수행하는 함수
 code by jake
 */
func startRockPaperScissors() {
    printRockPaperScissors()
    var number : Int?
    number = verifyInput(userInput : inputRockPaperScissors())
    guard let userNumber = number else { print("검증하지 못한 입력 값 이라서 종료됩니다."); return }
    switch userNumber {
    case -1 : // 사용자 입력이 0,1,2,3이 아닌 경우
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startRockPaperScissors()
    case 0 : // 사용자 입력이 0인 경우
        return print("게임 종료")
    default : // 사용자 입력이 1,2,3 중에 하나인 경우
        var result : String = "가위 바위 보 승패를 판단하지 못했습니다. 오류입니다."
        result = judgmentWinDrawLose(computerHand : createComputerRockPaperScissors(), userHand : userNumber)
        if result == "비겼습니다!" {
            return startRockPaperScissors()
        } else if result == "이겼습니다!" {
            startMukChiPa(rockPaperScissorsWinner : "사용자")
        } else {
            startMukChiPa(rockPaperScissorsWinner : "컴퓨터")
        }
    }
}

/*
 턴을 출력하는 함수
 code by kkomal
 */
func printMukChiPa(whoseTurn : String) {
    print("[\(whoseTurn) 턴] 묵(1). 찌(2). 빠(3)! <종료 : 0> : ", terminator:"") //whoseTurn의 공격
}

/*
 묵찌빠 비교 결과 승리자를 출력하는 함수
 code by kkomal
 */
func printMukChiPaResult(by judgement : String) {
    print(judgement)
}

/*
 묵찌빠 비교 결과 턴을 출력하는 함수
 code by kkomal
 */
func printTurn(by judgement : String) {
    switch judgement {
    case "사용자" : // 사용자의 턴으로 넘어왔을 경우
        print("\(judgement)의 턴입니다")
    default : // 컴퓨터의 턴으로 넘어갔을 경우
        print("\(judgement)의 턴입니다")
    }
}

/*
 묵찌빠 결과 비교하는 함수
 code by jake
 */
func judgementMukChiPaWinLose(computerHand : Int, userHand : Int, turn : String) -> String {
    var result : String = "승패를 구별하지 못했습니다. 오류입니다."
    let Muk = mukChiPa.Muk.rawValue
    let Chi = mukChiPa.Chi.rawValue
        switch computerHand {
        case Muk :
            if userHand == Muk { result = "\(turn)의 승리!" }
            else if userHand == Chi { result = "컴퓨터" }
            else { result = "사용자" }
        case Chi :
            if userHand == Muk { result = "사용자" }
            else if userHand == Chi { result = "\(turn)의 승리!" }
            else { result = "컴퓨터" }
        default :
            if userHand == Muk { result = "사용자" }
            else if userHand == Chi { result = "컴퓨터" }
            else { result = "\(turn)의 승리!" }
        }
    return result
}

/*
 묵 찌 빠 게임을 수행하는 함수
 code by jake
 */
func startMukChiPa(rockPaperScissorsWinner : String) {
    printMukChiPa(whoseTurn : rockPaperScissorsWinner) // 묵찌빠 출력해주는 함수
    var number : Int?
    number = verifyInput(userInput : inputRockPaperScissors())
    guard let userVerifiedInputNumber = number else { print("검증하지 못한 입력 값 이라서 종료됩니다."); return }
    switch userVerifiedInputNumber {
    case -1 : // 사용자 입력이 0,1,2,3이 아닌 경우 -> 컴퓨터 턴으로 넘어감
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startMukChiPa(rockPaperScissorsWinner : "컴퓨터")
    case 0 : // 사용자 입력이 0인 경우
        return print("게임 종료")
    default : // 사용자 입력이 1,2,3 중에 하나인 경우
        var judgment : String = "묵찌빠 승패를 판단하지 못했습니다. 오류입니다."
        judgment = judgementMukChiPaWinLose(computerHand : createComputerRockPaperScissors(), userHand : userVerifiedInputNumber, turn : rockPaperScissorsWinner)
        if judgment == "사용자" { // 묵찌빠 비교 결과 사용자의 턴인 경우
            printTurn(by : judgment)
            startMukChiPa(rockPaperScissorsWinner : judgment)
        } else if judgment == "컴퓨터" { // 묵찌빠 비교 결과 컴퓨터의 턴인 경우
            printTurn(by : judgment)
            startMukChiPa(rockPaperScissorsWinner : judgment)
        } else { // 묵찌빠 비교 결과 승리자가 나온 경우
            printMukChiPaResult(by : judgment)
        }
    }
}

startRockPaperScissors()
