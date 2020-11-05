//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// step 1의 고정 출력문
let order = "가위(1), 바위(2), 보(3)! <종료: 0> : "
// step 2의 고정 출력문
let orderRPS = "묵(1), 찌(2), 빠(3)! <종료: 0> : "

let userString = "[사용자 턴] "
let computerString = "[컴퓨터 턴] "

let userWin = "사용자의 승리!"
let computerWin = "컴퓨터의 승리!"

let errorInput = "잘못된 입력입니다. 다시 시도해주세요."

/*
 * step 1: 1(가위), 2(바위), 3(보)
 * step 2: 1(바위), 2(가위), 3(보)
 */
// 컴퓨터의 손 상태
var computerHand: Int
// 사용자의 손 상태
var userHand: Int

// 묵찌빠 턴 (1: 사용자, -1: 컴퓨터, 0: 불가)
var gameTurn = 0

/*
 * 가위바위보 (step1) 게임 함수
 * return 0 -> 비김
 * return 1 -> 사용자 이김
 * return -1 -> 컴퓨터 이김
 */
func gameScissorRockPaper(user: Int, computer: Int) -> Int {
    // 비겼음
    if user == computer {
        print("비겼습니다!")
        return 0
    }
    
    var result: Int
    switch user {
    case 1:
        if computer == 2 {
            result =  -1
        }
        else {
            result = 1
        }
    case 2:
        if computer == 3 {
            result =  -1
        }
        else {
            result = 1
        }
    case 3:
        if computer == 1 {
            result =  -1
        }
        else {
            result = 1
        }
    default:
        return 0
    }
    
    if result == 1 {
        print("이겼습니다!")
    }
    else {
        print("졌습니다!")
    }
    
    return result
}

func convertHand(_ origin: Int) -> Int {
    switch origin {
    case 1:
        return 2
    case 2:
        return 1
    case 3:
        return 3
    default:
        return 0
    }
}

/*
 * 묵찌빠 (step2) 게임 함수
 * return 0 -> 패가 같음
 * return 1 -> 사용자 턴
 * return -1 -> 컴퓨터 턴
 */
func gameRockPaperScissor(user: Int, computer: Int) -> Int {
    // 패가 같음 -> 현재 턴인 사람이 승리
    if user == computer {
        return 0
    }
    
    switch user {
    case 1:
        if computer == 3 {
            return -1
        }
        return 1
    case 2:
        if computer == 1 {
            return -1
        }
        return 1
    case 3:
        if computer == 2 {
            return -1
        }
        return 1
    default:
        return 0
    }
}

/*
 * step 1
 */
// 게임 종료
var exit = false

while !exit {
    print(order)
    
    guard let input = readLine() else {
        exit = true
        break
    }
    
    if let number = Int(input),
       number >= 0 && number <= 3 {
        // 게임 종료
        if number == 0 {
            exit = true
            break
        }
        
        userHand = number
        computerHand = Int.random(in: 1...3)
        
        // 가위바위보 결과
        gameTurn = gameScissorRockPaper(user: userHand, computer: computerHand)
        // 비긴 경우는 다시 게임
        if gameTurn == 0 {
            continue
        }
        
        // 이기거나 진 경우는 묵찌빠로 넘어감 -> step1, step2에서 숫자가 의미하는 손 상태가 다르므로 변환 필요
        userHand = convertHand(userHand)
        computerHand = convertHand(computerHand)
        
        break
    }
    // 잘못된 입력
    else {
        print(errorInput)
    }
}


/*
 * step 2
 */
while !exit {
    print((gameTurn == 1 ? userString : computerString) + orderRPS)
    
    guard let input = readLine() else {
        exit = true
        break
    }
    
    if let number = Int(input),
       number >= 0 && number <= 3 {
        // 게임 종료
        if number == 0 {
            exit = true
            break
        }
        
        userHand = number
        computerHand = Int.random(in: 1...3)
        
        // 묵찌빠 결과
        let result = gameRockPaperScissor(user: userHand, computer: computerHand)
        // 패가 동일하다면 턴이 이김
        if result == 0 {
            // 사용자 턴이라면 사용자가 승리
            gameTurn > 0 ? print(userWin) : print(computerWin)
            exit = true
            break
        }
        
        gameTurn = result
    }
    // 잘못된 입력
    else {
        // 컴퓨터한테 턴이 넘어감
        gameTurn = -1
        print(errorInput)
    }
}
