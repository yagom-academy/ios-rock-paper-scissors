//
//  RockPaperScissors - main.swift
//  Created by Coda & Tak
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

///## 가위바위보에 대한 기능(속성)과 메서드(행동)을 'RockPaperScissors 타입'으로 묶었음.
///----------
///- Computer의 임의의 수와 User에게 입력받은 값을 배열로 묶어 표현함.
///- 컴퓨터의 수에서 사용자의 수를 빼서 나올수 있는 경우의 수를 묶어 결과값을 산출하였음
///   - 승리할 시 (-1,2) / 패배할 시 (-2,1) / 비겼을 시 (0)
enum Starting {
    case start
    case restart
    case exit
}

enum ResultOfGame {
    case userWin
    case draw
    case computerWin
}
//commit template TEST

class RockPaperScissors { // RPCs game
    var inputNumber: Int = 0
    var inputString: String = ""
    var randomNumber: Int = 0
    var gameMenu: Starting = Starting.restart
    var gameCommand: ResultOfGame = ResultOfGame.draw
    
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
    
 ///- 사용자에게 입력받은 값이 "0"일 경우 그만하기, "1","2","3"일 경우 return, 그 외 입력값은 문구 출력 후 다시하기
   func checkInputString() {
        switch inputString {
        case "0":
            gameMenu = Starting.exit
        case "1", "2", "3":
            gameMenu = Starting.start
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            gameMenu = Starting.restart
        }
    }
    
///- 컴퓨터의 수에서 사용자입력값을 뺀 값에 따라 각각 case로 결과 산출
///  - ex) 컴퓨터의 수: 1(가위) - 사용자입력값: 2(바위) = -1로 사용자승리
///- 결과가 0일 때 "비겼습니다!" 문구 출력 후 다시하기 / 그 외 결과일 시 다시하기
    func makeResult(a: Int, b: Int, c: Starting) {
        if c == Starting.start {
            switch (a - b) {
            case -1, 2:
                print("이겼습니다.")
                gameCommand = ResultOfGame.userWin
            case 1, -2:
                print("졌습니다.")
                gameCommand = ResultOfGame.computerWin
            case 0:
                print("비겼습니다.")
                gameCommand = ResultOfGame.draw
            default:
                return
            }
        }
    }
    
    func initializeNumbers() {
        inputNumber = 0
        randomNumber = 0
    }
    
///- gameCommand  == "다시하기" 일 시 반복
///- 게임을 진행하는 메서드
    func start() {
        while gameCommand == ResultOfGame.draw || gameMenu == Starting.restart {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "") // printMenu func
            makeRandomNumber()
            inputUserNumber()
            checkInputString()
            makeResult(a: randomNumber, b: inputNumber, c: gameMenu)
            initializeNumbers()
        }
    }
}

var rockPaperScissors = RockPaperScissors()
rockPaperScissors.start()



print(rockPaperScissors.gameCommand)

var turn: String = ""







// 묵찌빠를 만들어봅시다.
































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
