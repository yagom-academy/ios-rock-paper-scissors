//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let regex = #"^[0-3]$"#
func isNumber(_ input: String) -> Bool {
    return input.range(of: regex, options: .regularExpression) != nil
}

func gameRun() {
    var loopFlag = true
    
    while loopFlag {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard let safeUserInput = userInput else {
            print("잘못된 입력입니다. 다시 시도하여 주세요.")
            loopFlag = false
            return
        }
        
        if (!isNumber(safeUserInput)) {
            print("0-3까지의 수를 입력해주세요.")
            continue
        }
        
        if (safeUserInput == "0") {
            print("게임 종료")
            return
        }
        
        judgeGame(userChoice: safeUserInput)
        
        loopFlag = false
    }
}

func judgeGame(userChoice: String) {
    let computerChoice = makeComputerChoice()
    
    switch (userChoice, computerChoice) {
    case (_, _) where userChoice == computerChoice:
        print("비겼습니다!")
    case ("1", "3"), ("2", "1"), ("3", "2"):
        print("이겼습니다!")
    default:
        print("졌습니다!")
    }
}

func makeComputerChoice() -> String {
    let computerChoice = String(Int.random(in: 1...3))
    return String(computerChoice)
}

var whoseTurn = "computer"

func runGameStep2() {
    // 게임 진행
    // 컴퓨터의 임의의 수를 뽑는다
    let computerChoice = makeComputerChoice()
    
    var loopFlag = true
    
    while loopFlag {
        print("[\(whoseTurn)의 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        
        let userInput = readLine()
        
        guard let userChoice = userInput else {
            print("잘못된 입력입니다. 다시 시도하여 주세요.")
            loopFlag = false
            return
        }
        
        if (!isNumber(userChoice)) {
            print("0-3까지의 수를 입력해주세요.")
            continue
        }
        
        if (userChoice == "0") {
            print("게임 종료")
            return
        }
        
        // if 컴퓨터가 이겼다면
        // 컴퓨터의 턴이며 값이 같을 경우, whoseTurn이 컴퓨터일 때,
//        if (whoseTurn == "computer" && userChoice == computerChoice) {
//            
//        }
        if (userChoice == computerChoice) {
            if whoseTurn == "computer" {
                print("컴퓨터의 승리!")
            } else {
                print("사용자의 승리!")
            }
        } else {
            
        }
        
        // else if 사용자가 이겼다면
        
        // else 잘못된 입력인 경우
        // 컴퓨터에게 턴을 넘긴다
        
        // 사용자에게 0부터 3까지 입력 받는다
        // 결과를 출력한다
        
        // if 사용자 == 컴퓨터
        // 현재 턴을 차지한 자가 승리한다
        
        // else if 사용자 != 컴퓨터
        // if 사용자 패랑 컴퓨터 패를 비교한다
        // 묵찌빠 다시 실행한다
        
        // else if 입력이 0인 경우
        // 게임 종료
        
        loopFlag = false
    }
}

gameRun()
