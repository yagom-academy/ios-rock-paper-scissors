//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
/*
 
func startGameSRP : 가위바위보 게임을 실행한다
func inputNumis123 : 가위바위보 게임 > 이용자의 입력값이 1,2,3일 경우 실행한다
func userWin : 가위바위보 게임 > 이용자가 이겼을 때 묵찌빠 게임을 실행한다
func computerWin : 가위바위보 게임 > 컴퓨터가 이겼을 때 묵찌빠 게임을 실행한다
func userWinInputNumIs123 : 가위바위보 > 이용자승 > 묵찌빠 > 이용자의 입력값이 1,2,3일 경우 실행한다
func computerWinInputNum123 : 가위바위보 > 컴퓨터승 > 묵찌빠 > 이용자의 입력값이 1,2,3일 경우 실행한다
 
 */

func inputNumIs123(inputNum: Int) {
    let randomNumber = Int.random(in:1...3)
    if inputNum == randomNumber {
        print("비겼습니다")
        startGameSRP()
    } else {
        let relation = (x: inputNum, y: randomNumber)
           switch relation {
        case (1, 3), (2, 1), (3, 2):
            print("이겼습니다")
            userWin(inputNum: inputNum)
        default:
            print("졌습니다")
            computerWin(inputNum: inputNum)
        }
    }
}

func userWinInputNumIs123(inputNum: Int) {
    let num2 = Int.random(in:1...3)
    if inputNum == num2 {
        print("사용자가 이겼습니다")
    } else {
        let relation = (x: inputNum, y: num2)
        switch relation {
        case (1, 2), (2, 3), (3, 1):
            userWin(inputNum: inputNum)
        default:
            computerWin(inputNum: inputNum)
        }
    }
}

func computerWinInputNumIs123(inputNum: Int) {
    let num2 = Int.random(in:1...3)
    if inputNum == num2 {
        print("컴퓨터가 이겼습니다")
    } else {
        let relation = (x: inputNum, y: num2)
           switch relation {
        case (1, 2), (2, 3), (3, 1):
            computerWin(inputNum: inputNum)
        default:
            userWin(inputNum: inputNum)
        }
    }
}

func userWin(inputNum: Int) {
    print("[이용자턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: "")
    if let input = readLine() {
        if let inputNum = Int(input) {
            switch inputNum {
                case 0 :
                    print("종료되었습니다")
                case 1, 2, 3 :
                    userWinInputNumIs123(inputNum: inputNum)
                default :
                    print("잘못된 입력입니다. 컴퓨터 턴으로 돌아갑니다")
                    computerWin(inputNum: inputNum)
            }
        } else {
            print("잘못된 입력입니다. 컴퓨터 턴으로 돌아갑니다")
            computerWin(inputNum: inputNum)
        }
    }
}

func computerWin(inputNum: Int) {
    print("[컴퓨터턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: "")
    if let input2 = readLine() {
        if let inputNum2 = Int(input2) {
            switch inputNum2 {
                case 0 :
                    print("종료되었습니다")
                case 1, 2, 3 :
                    computerWinInputNumIs123(inputNum: inputNum)
                default :
                    print("잘못된 입력입니다. 컴퓨터 턴으로 돌아갑니다")
                    computerWin(inputNum: inputNum)
            }
        } else {
            print("잘못된 입력입니다. 컴퓨터 턴으로 돌아갑니다")
            computerWin(inputNum: inputNum)
        }
    }
}

func startGameSRP() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: "")
    if let input = readLine() {
        if let inputNum = Int(input) {
            switch inputNum {
                case 0 :
                    print("종료되었습니다")
                case 1, 2, 3 :
                    inputNumIs123(inputNum: inputNum)
                default :
                    print("잘못된 입력입니다. 다시 시도해주세요")
                    startGameSRP()
            }
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요")
            startGameSRP()
        }
    }
}

startGameSRP()




