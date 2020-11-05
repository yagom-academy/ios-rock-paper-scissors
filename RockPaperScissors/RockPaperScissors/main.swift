//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

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
func judgmentWinDrawLose(computer : Int, user : Int) -> String {
    var result : String = ""
    switch computer {
    case 1 : // computer 가위인 경우
        if user == 1 { print("비겼습니다!"); result = "비겼습니다!" }
        else if user == 2 { print("이겼습니다!"); result = "이겼습니다!" }
        else { print("졌습니다!"); result = "졌습니다!" }
    case 2 : // computer 바위인 경우
        if user == 1 { print("졌습니다!"); result = "졌습니다!" }
        else if user == 2 { print("비겼습니다!"); result = "비겼습니다!" }
        else { print("이겼습니다!"); result = "이겼습니다!" }
    default : // computer 보인 경우
        if user == 1 { print("이겼습니다!"); result = "이겼습니다!" }
        else if user == 2 { print("졌습니다!"); result = "졌습니다!" }
        else { print("비겼습니다!"); result = "비겼습니다!" }
    }
    return result
}

/*
 컴퓨터의 패를 정해주는 함수
 난수를 통해서 1~3중 하나의 값을 갖는다
 code by kkomal
 */
@discardableResult
func isChoiceComputer() -> Int {
    let computerNum = Int.random(in: 1...3)
    return computerNum
}

/*
 사용자에게 가위 바위 보 중 하나를 입력받는 함수
 0~3값만 입력받게하고 다른 값 입력시 예외처리
 code by kkomal
 */
func inputRockPaperScissors() {
    printRockPaperScissors()
    guard let input = readLine() else { return print("게임 종료") }
    guard let userNum = Int(input) else { return print("게임 종료") }
    
    if 0 > userNum || userNum > 3 {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    else if userNum == 0 {
        return print("게임 종료")
    }
    else {
        judgmentWinDrawLose(computer: isChoiceComputer(), user: userNum)
    }
    
    return inputRockPaperScissors()
}

/*
 가위 바위 보 게임을 수행하는 함수
 code by jake
 */
func RockPaperScissorsGame() {
    printRockPaperScissors()
    var userNum : Int = 0
    userNum = verifyInput(userInput: inputRockPaperScissors())
    switch userNum {
    case -1 : // 사용자 입력이 0,1,2,3이 아닌 경우
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return RockPaperScissorsGame()
    case 0 : // 사용자 입력이 0인 경우
        return print("게임 종료")
    default : // 사용자 입력이 1,2,3 중에 하나인 경우
        var resultString : String = ""
        resultString = judgmentWinDrawLose(computer: createComputerRockPaperScissors(), user: userNum)
        if resultString == "비겼습니다!" {
            return RockPaperScissorsGame()
        }
    }
}

func main(){
    RockPaperScissorsGame()
}
