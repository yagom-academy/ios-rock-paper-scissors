//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//랜덤변수 computerPick을 이용해 컴퓨터의 가위,바위,보 호출
func printComputerPick(_ computerPick : Int) {
    switch computerPick {
    case 1:
        print("컴퓨터 : 가위")
    case 2:
        print("컴퓨터 : 바위")
    case 3:
        print("컴퓨터 : 보")
    default:
        print("1...3이 아닌 다른값이 들어올 경우가 있을까??")
    }
}


func rockPaperScissors() {
    print("가위(1),바위(2),보(3)! <종료 : 0> : ", terminator : "")
    guard let usersPick = readLine() else { return }
    let computerPick = Int.random(in: 1...3)
//    유저에게 입력받은 usersPick이 String타입임을 확인
//    print(type(of: usersPick))
    switch usersPick {
    case "0" :
        print("가위바위보 프로그램이 종료됩니다.")
        break
    case "1" :
        print("사용자 : 가위")
        printComputerPick(computerPick)
    case "2" :
        print("사용자 : 바위")
        printComputerPick(computerPick)
    case "3" :
        print("사용자 : 보")
        printComputerPick(computerPick)
    default:
        print("잘못된 입력입니다. 다시 시도해 주세요.")
        rockPaperScissors()
    }
}

rockPaperScissors()
