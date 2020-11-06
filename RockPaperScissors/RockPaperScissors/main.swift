//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 플레이어 승리 상태
enum GameStateIs: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

// 가위, 바위, 보
enum Hand: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case empty
}

// 플레이어 상태에 대한 전역변수
var playerIs: GameStateIs = .draw

// 입력 에러 출력 및 게임 재시작
func printInputErrorAndResartGame() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
    PlayrockPaperSsissors()
}

// 누가 이겼는지 확인
func checkWhoIsWinner(_ playerHand: Hand, vs computerHand: Hand) {
    playerIs = .lose
    if playerHand == computerHand { playerIs = .draw }
    switch playerHand {
    case .scissors:
        if computerHand == .paper { playerIs = .win }
    case .rock:
        if computerHand == .scissors { playerIs = .win }
    case .paper:
        if computerHand == .rock { playerIs = .win }
    default:
        printInputErrorAndResartGame()
    }
}

// 컴퓨터의 패를 결정하고, 사용자의 패를 입력받은 후 비교하고 출력
func PlayrockPaperSsissors() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    
    var player: Hand = .empty
    guard let computer: Hand = Hand(rawValue: Int.random(in: 1...3)) else { return }
    guard let input = readLine() else {
        printInputErrorAndResartGame()
        return
    }
    
    if input == "0" {
        print("게임 종료")
        return
    }
    if let inputNumber = Int(input) {
        if inputNumber >= 1 && inputNumber <= 3 {
            player = Hand(rawValue: inputNumber)!
        }
    } else {
        printInputErrorAndResartGame()
        return
    }
    
    checkWhoIsWinner(player, vs: computer)
    print(computer)
    print(playerIs.rawValue)
    // 비긴 경우 새로 시작
    if playerIs == .draw { PlayrockPaperSsissors() }
}

PlayrockPaperSsissors()

/*
func mukchiba() {
    // winner에 승리자가 player이면 1, computer이면 2
    var winner: Int = rockScissorPaperGame()
    var condition: Int = 3 // rspWinnerChecker에서 받아오는 값
    
    while true {
        if winner == 1 { print("[사용자 턴] ", terminator: "") }
        else { print("[컴퓨터 턴] ", terminator: "") }
        print("묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
        
        guard let input = readLine() else { return }
        
        switch input {
        case "0":
            print("게임 종료")
            break
        case "1":
            condition = mcbWinnerChecker(1)
        case "2":
            condition = mcbWinnerChecker(2)
        case "3":
            condition = mcbWinnerChecker(3)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
        
        switch condition {
        case 0:
            if winner == 1 { print("사용자의 ", terminator: "") }
            else { print("컴퓨터의 ", terminator: "") }
            print("승리!")
            return
        case 1:
            winner = 1
        default:
            winner = 2
        }
    }
}

mukchiba()
*/
