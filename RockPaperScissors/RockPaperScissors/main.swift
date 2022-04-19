//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func verifyRockPaperScissors(rps: Int?) {
    // rps == optional<Int>
    switch rps {
    case 0 :
        // 사용자입력값이랑 컴퓨터 패랑 비교하는 함수 호출
        // 호출 한 함수는 printMessage 함수를 호출
        // 메시지 호출하고 종료
    case 1 :
        guard 1 != rps else { return print("승리") }
    case 2 : 
        guard 2 != rps else { return print("패배") }
    default : 
        print("x")
    }
}

func showGameMenu() {
    var isStart = true
    while isStart {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let inputMenuNumber = readLine() ?? ""
        switch inputMenuNumber {
        case "1", "2", "3" :
            let rockPaperScissors = makeRandomNumber()
        case "0" :
            print("게임 종료")
            isStart = false
            break
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
            break
        }
    }
}

func makeRandomNumber() -> String {
    let randomNumber = Int.random(in: 1...3)
    return String(randomNumber)
}

// 컴퓨터 사용자 값 서로 비교해서 검증하는 함수 생성
// printMessage 함수 생성

func input() {
    if let rps = readLine() {
        //정수 변환
        verifyRockPaperScissors(rps: Int(rps))
    }
}

func comparePlayerInputAndComputerNumber(userInput: String?) -> Int {
    
}

func printResult(result: Int) {
    switch result {
    case 0:
    print("비겼습니다!")
    case 1:
    print("이겼습니다!")
    case 2:
        print("졌습니다!")
    default:
        
    }
}

input()


// func showMenu() {
//     while  {
        
//     }
//     // 0,1,2 가 입력되는 경우에는 verify함수로 보내고
//     // 3, 그 외는 여기서 처리해서 잘못된 입력, 다시 시도 하세요
//     // 출력하고 최초 상태로 복귀
// }
