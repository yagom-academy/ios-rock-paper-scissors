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
    default:
        print("컴퓨터 : 보")
    }
}

//userPick기준으로 비기고 이기고 지는거 정리
//user 1=가위
//1-1 비겼다, 1가위-2바위 졌다 , 1가위-3보 이겼다
//user 2=바위
//2바위-1가위 이겼다, 2-2 비겼다, 2바위-3보 졌다
//user 3=보
//3보-1가위 졌다, 3보-2바위 이겼다, 3-3 비겼다
func comparePick(_ usersPick : String, _ computerPick : Int){
    if usersPick == String(computerPick){
        print("비겼습니다.")
        rockPaperScissors()
    } else if usersPick == "1" {
        switch computerPick {
        case 2:
            print("졌습니다.")
        default:
            print("이겼습니다.")
        }
    } else if usersPick == "2" {
        switch computerPick {
        case 1:
            print("이겼습니다.")
        default:
            print("졌습니다.")
        }
    } else  {
        switch computerPick {
        case 1:
            print("졌습니다.")
        default:
            print("이겼습니다.")
        }
    }
}

func rockPaperScissors() {
    print("가위(1),바위(2),보(3)! <종료 : 0> : ", terminator : "")
    guard let usersPick = readLine() else { return }
    let computerPick = Int.random(in: 1...3)
//유저에게 입력받은 usersPick이 String타입임을 확인
//print(type(of: usersPick))
    switch usersPick {
    case "0" :
        print("가위바위보 프로그램이 종료됩니다.")
        break
    case "1" :
        print("사용자 : 가위")
        printComputerPick(computerPick)
        comparePick(usersPick, computerPick)
    case "2" :
        print("사용자 : 바위")
        printComputerPick(computerPick)
        comparePick(usersPick, computerPick)
    case "3" :
        print("사용자 : 보")
        printComputerPick(computerPick)
        comparePick(usersPick, computerPick)
    default:
        print("잘못된 입력입니다. 다시 시도해 주세요.")
//한줄안띄워주면 눈이 너무 아파서 한줄개행
        print()
        rockPaperScissors()
    }
}

rockPaperScissors()
