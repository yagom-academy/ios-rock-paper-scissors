//
//  RockPaperScissors - main.swift
//  Created by Coda & Tak
//  Copyright © yagom academy. All rights reserved.
//
import Foundation


enum GameDecision {
    case start
    case restart
    case exit
}

///
enum GameResult {
    case win
    case draw
    case lose
}

/** ## 가위바위보에 대한 기능(속성)과 메서드(행동)을 'RockPaperScissors 타입'으로 묶었음.
----------
- Computer의 임의의 수와 User에게 입력받은 값을 배열로 묶어 표현함.
- 컴퓨터의 수에서 사용자의 수를 빼서 나올수 있는 경우의 수를 묶어 결과값을 산출하였음
- 승리할 시 (-1,2) / 패배할 시 (-2,1) / 비겼을 시 (0) */
class RockPaperScissorsGame {
    var inputNumber: Int = 0
    var inputString: String = ""
    var randomNumber: Int = 0
    var gameMenu: GameDecision = GameDecision.restart
    var gameCommand: GameResult = GameResult.draw
    
    ///컴퓨터에서 가위바위보 중 무엇을 낼지를 결정하는 단계
    func makeRandomNumber() {
        randomNumber = Int.random(in: 1...3)
    }

    /// 입력값을 받아 Bool 타입으로 반환.
    /// 입력값은 class 내부의 변수로 저장.
    func checkInputNumber() -> Bool {
        guard let temporaryValue: String = readLine(),
              let deliveryNumber: Int = Int(temporaryValue)
        else { return false }
        inputNumber = deliveryNumber
        return true
    }
    
    /// checkInputNumber의 Bool값을 통해 예외 사항(nil 혹은 문자열을 입력했을 시)을 처리하고
    /// inputNumber에 저장된 숫자를 바탕으로 게임진행여부 결정
    func decideGamePlaying() {
        switch checkInputNumber() {
        case false:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            gameMenu = GameDecision.restart
        case true:
            switch inputNumber {
            case 0:
                gameMenu = GameDecision.exit
            case 1, 2, 3:
                gameMenu = GameDecision.start
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
                gameMenu = GameDecision.restart
            }
        }
    }
    /**
    ### 컴퓨터의 수에서 사용자 입력값을 뺀 값에 따라 각각의 case 분류
    - ex) 컴퓨터의 수: 1(가위) - 사용자입력값: 2(바위) = -1로 사용자승리
    ------
    - case에 따라 win, lose, draw 값을 gameCommand에 저장.*/
    func sortResult(a: Int, b: Int, c: GameDecision) { // #1 이 부분을 물어보고 싶습니다!!!!
        if c == GameDecision.start {
            switch (a - b) {
            case -1, 2:
                gameCommand = GameResult.win
            case 1, -2:
                gameCommand = GameResult.lose
            case 0:
                gameCommand = GameResult.draw
            default:
                return
            }
        }
    }
    
    ///결과값 출력
    func printResult() {
        switch gameCommand {
        case GameResult.win:
            print("이겼습니다.")
        case GameResult.lose:
            print("졌습니다.")
        case GameResult.draw:
            print("비겼습니다.")
        }
    }
    
    /// 컴퓨터, 사용자 가위바위보 초기화
    func initializeNumbers() {
        inputNumber = 0
        randomNumber = 0
    }
    
    ///## 게임을 시작하는 메서드
    ///---------
    ///- 컴퓨터와 사용자가 서로 비겼거나, 게임 진행 여부가 restart일때 반복.
    ///- 처음에 while문 내부로 진입하기 위해. gameCommand의 값을 draw로, GameDecision의 값을 restart로 설정해두었음.
    func start() {
        while gameCommand == GameResult.draw || gameMenu == GameDecision.restart {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            makeRandomNumber()
            decideGamePlaying()
            sortResult(a: randomNumber, b: inputNumber, c: gameMenu)
            printResult()
            initializeNumbers()
        }
    }
}


let rockPaperScissors = RockPaperScissorsGame() //인스턴스화
rockPaperScissors.start() // 실행...!!!

