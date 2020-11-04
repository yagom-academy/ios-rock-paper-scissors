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
func printRockPaperScissors () {
    print("가위(1).바위(2).보(3)! <종료 : 0> : ", terminator:"")
}

/*
 가위 바위 보 승부를 판단하는 함수
 computer와 user 모두 입력은 1,2,3만 들어오는 것을 가정하고 코드 작성
 즉, 0이나 4이상의 숫자에 대한 예외처리는 입력 받을 때 처리 되어야할 것 같다.
 code by jake
 */
@discardableResult
func judgmentWinDrawLose (computer : Int, user : Int) -> Int {
    // resultNum = 1 비겼습니다.
    // resultNum = 2 졌습니다.
    // resultNum = 3 이겼습니다.
    var resultNum = 0
    
    switch computer {
    case 1 : // computer 가위인 경우
        if user == 1 { print("비겼습니다!"); resultNum = 1 }
        else if user == 2 { print("이겼습니다!"); resultNum = 3 }
        else { print("졌습니다!"); resultNum = 2 }
    case 2 : // computer 바위인 경우
        if user == 1 { print("졌습니다!"); resultNum = 2 }
        else if user == 2 { print("비겼습니다!"); resultNum = 1 }
        else { print("이겼습니다!"); resultNum = 3 }
    default : // computer 보인 경우
        if user == 1 { print("이겼습니다!"); resultNum = 3 }
        else if user == 2 { print("졌습니다!"); resultNum = 2 }
        else { print("비겼습니다!"); resultNum = 1 }
    }
    
    return resultNum
}

/*
 컴퓨터의 패를 정해주는 함수
 난수를 통해서 1~3중 하나의 값을 갖는다
 code by kkomal
 */
@discardableResult
func isChoiceCom() -> Int {
    let comNum = arc4random_uniform(3) + 1
    return Int(comNum)
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
        judgmentWinDrawLose(computer: isChoiceCom(), user: userNum)
    }
    
    return inputRockPaperScissors()
}

inputRockPaperScissors()
