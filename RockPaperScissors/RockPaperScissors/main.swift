//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  2020.11.04 Green written

import Foundation

//가위바위보 함수
func scissorsRockPaper () {
    print("가위(1), 바위(2), 보(3)!<종료 : 0> : ", terminator: " ")
    
    guard let users: String = readLine() else {return}
    let computer = arc4random_uniform(3) + 1
    
    switch users {
    case "0":
        print("게임 종료")
        break
    case "1":
        if computer == 1 {
            print("비겼습니다!")
            scissorsRockPaper()
        } else if computer == 2 {
            print("졌습니다!")
            rockScissorsPaper(result: "lose")
        } else {
            print("이겼습니다!")
            rockScissorsPaper(result: "win")
        }
    case "2":
        if computer == 2 {
            print("비겼습니다!")
            scissorsRockPaper()
        } else if computer == 3 {
            print("졌습니다!")
            rockScissorsPaper(result: "lose")
        } else {
            print("이겼습니다!")
            rockScissorsPaper(result: "win")
        }
    case "3":
        if computer == 3 {
            print("비겼습니다!")
            scissorsRockPaper()
        } else if computer == 1 {
            print("졌습니다!")
            rockScissorsPaper(result: "lose")
        } else {
            print("이겼습니다!")
            rockScissorsPaper(result: "win")
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        scissorsRockPaper()
    }
}

//묵찌빠 함수
func rockScissorsPaper(result: String) {
    switch result {
    case "lose":
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> : ",terminator: " ")
        guard let users: String = readLine() else{return}
        let computer = arc4random_uniform(3) + 1
        
        if ((users=="1" && computer==2) || (users=="2" && computer==3) || (users=="3" && computer==1)) {
            print("사용자의 턴입니다")
            rockScissorsPaper(result: "win")
        } else if ((users=="1" && computer==3) || (users=="2" && computer==1) || (users=="3" && computer==2)) {
            print("컴퓨터의 턴입니다")
            rockScissorsPaper(result: "lose")
        } else if ((users=="1" && computer==1) || (users=="2" && computer==2) || (users=="3" && computer==3)) {
            print("컴퓨터의 승리!")
            break
        } else if (users=="0") {
            print("게임 종료")
            break
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            rockScissorsPaper(result: "lose")
        }
    case "win":
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> : ",terminator: " ")
        guard let users: String = readLine() else{return}
        let computer = arc4random_uniform(3) + 1
        
        if ((users=="1" && computer==2) || (users=="2" && computer==3) || (users=="3" && computer==1)) {
            print("사용자의 턴입니다")
            rockScissorsPaper(result: "win")
        } else if ((users=="1" && computer==3) || (users=="2" && computer==1) || (users=="3" && computer==2)) {
            print("컴퓨터의 턴입니다")
            rockScissorsPaper(result: "lose")
        } else if ((users=="1" && computer==1) || (users=="2" && computer==2) || (users=="3" && computer==3)) {
            print("사용자의 승리!")
            break
        } else if (users=="0") {
            print("게임 종료")
            break
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            rockScissorsPaper(result: "lose")
        }
        default:
            break
    }
}

//게임 호출
scissorsRockPaper()
