//
//  RockPaperScissors - main.swift
//  Created by Coda & Tak
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

///## 가위바위보에 대한 기능(속성)과 메서드(행동)을 'RockPaperScissors 타입'으로 묶었음.
///----------
///- Computer의 임의의 수와 User에게 입력받은 값을 배열로 묶어 표현함.
///- 배열 내의 수를 연산하여 나올수 있는 경우의 수를 묶어 결과값을 산출하였음
///   - 승리할 시, [3, ]
class RockPaperScissors { // RPCs game
    var inputNumber: Int = 0
    var inputString: String = ""
    var randomNumber: Int = 0
    var gameCommand: String = "다시하기"

    func makeRandomNumber() {
        randomNumber = Int.random(in: 1...3)
    }

    func inputUserNumber() {
        let temporaryStorage: String? = readLine()
        guard let temporaryString: String = temporaryStorage else { return }
        guard let temporaryInt = Int(temporaryString) else { return }
        inputString = temporaryString
        inputNumber = temporaryInt
    }
 
    func makeArrayOrReturn() {
        switch inputString {
        case "0":
            gameCommand = "그만하기"
        case "1", "2", "3":
            gameCommand = ""
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            inputNumber = 10
            gameCommand = "다시하기"
        }
    }

    func makeResult() {
        switch (randomNumber - inputNumber) {
        case -1, 2:
            print("이겼습니다.")
            gameCommand = "사용자승리"
        case 1, -2:
            print("졌습니다.")
            gameCommand = "컴퓨터승리"
        case 0:
            print("비겼습니다.")
            gameCommand = "다시하기"
        default:
            gameCommand = "다시하기"
            return
        }
    }
    
    func start() {
        while gameCommand == "다시하기" {
            inputNumber = 0
            randomNumber = 0 // initialize func
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "") // printMenu func
            makeRandomNumber()
            inputUserNumber()
            makeArrayOrReturn()
            makeResult()
        }
    }
}

var rockPaperScissors = RockPaperScissors()
rockPaperScissors.start()


//CODA, Tak 초안
/*
    func makeArrayOrReturn() {
        if inputString == "0" {
            restartKeyNumber = 0
        } else if inputString == "1" || inputString == "2" || inputString ="3" {
            makeArray()
            restartKeyNumber = 0
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            restartKeyNumber = 1
        }
    }
*/
        
/*
    func makeArray() {
        storageOfComputerAndUserNumber.append(randomNumber)
        storageOfComputerAndUserNumber.append(inputNumber)
        }
*/
        
/*
    func makeResult() {
        if storageOfComputerAndUserNumber == [1,2] || storageOfComputerAndUserNumber == [2,3] || storageOfComputerAndUserNumber == [3,1] {
            print("이겼습니다!")
            restartKeyNumber = 0
            return
        } else if storageOfComputerAndUserNumber == [2,1] ||
                    storageOfComputerAndUserNumber == [3,2] || storageOfComputerAndUserNumber == [1,3] {
            print("졌습니다!")
            restartKeyNumber = 0
            return
        } else if randomNumber == inputNumber {
            print("비겼습니다!")
            restartKeyNumber = 1
            return
            // 최초상태로 복귀
        }
    }
 */
 // CODA, Tak 초안
