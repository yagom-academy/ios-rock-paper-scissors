//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var winnerIsPlayer = false

enum rpsHand : Int{
    case sissor = 1
    case rock = 2
    case paper = 3
}

enum mcpHand : Int{
    case rock = 1
    case sissor = 2
    case papper = 3
}

func playRockPaperScissors(myValue: Int){

    let opponentValue = Int.random(in: 1...3)
    print(opponentValue)

    if myValue == opponentValue{
        print("비겼습니다!")
        startRockPaperScissors()

    }else if (myValue == rpsHand.sissor.rawValue && opponentValue == rpsHand.rock.rawValue ) ||
                (myValue == rpsHand.rock.rawValue && opponentValue == rpsHand.paper.rawValue) ||
                (myValue == rpsHand.paper.rawValue && opponentValue == rpsHand.sissor.rawValue) {

        print("졌습니다!")
        winnerIsPlayer = false

    }else{
        print("이겼습니다!")
        winnerIsPlayer = true
    }
}

func startRockPaperScissors(){
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")

    if let input = readLine(){
        switch input {
            case "1","2","3":
                if let myValue = Int(input) {playRockPaperScissors(myValue: myValue) }
                return

            case "0" :
                print("게임을 종료합니다.")
                return

            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
                startRockPaperScissors()
        }
    }
}

func playMukchipa(myValue: Int){

    let opponentValue = Int.random(in: 1...3)
    print(opponentValue)

    if myValue == opponentValue{
        if winnerIsPlayer == true {
            print("사용자의 승리!")
        }else{
            print("컴퓨터의 승리!")
        }
        return

    }else if (myValue == mcpHand.rock.rawValue && opponentValue == mcpHand.papper.rawValue ) ||
                (myValue == mcpHand.sissor.rawValue && opponentValue == mcpHand.rock.rawValue) ||
                (myValue == mcpHand.papper.rawValue && opponentValue == mcpHand.sissor.rawValue) {
        winnerIsPlayer = false
        startMukchipa()

    }else{
        winnerIsPlayer = true
        startMukchipa()
    }
}

func startMukchipa(){
    
    if (winnerIsPlayer == true) {
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")

    }else {
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
        if let input = readLine(){
            switch input {
                case "1", "2", "3" :
                    if let myValue = Int(input) {playMukchipa(myValue: myValue)}
                    return

                case "0" :
                    print("게임을 종료합니다.")
                    return

                default:
                    print("잘못된 입력입니다. 다시 시도해주세요.")
                    startMukchipa()
            }
        }
}

func startGame(){
    startRockPaperScissors()
    startMukchipa()
}
startGame()
