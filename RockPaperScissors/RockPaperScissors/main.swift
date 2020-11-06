//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

// 전역변수
//1. 유지보수가 어렵다
//2. 여기저기서 접근할 수 있어서 보안에 어려움이 있음
//3. 의도치 않게 값이 변경될 수도있고...
//4. 메모리

// 전역변수, 함수에 and 사용, checkWhoIsWinner 이름 변경, 가위바위보 반환값 없애기

import Foundation

// 플레이어 승리 상태
enum GameState: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case exit
}

// 가위, 바위, 보
enum Hand: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case empty
}

// 누가 승리했는지
enum WinnerState: String {
    case player = "사용자"
    case computer = "컴퓨터"
    case empty
}

// input에러 출력
func printInputError() {
    print("잘못된 입력입니다. 다시 입력해주세요.")
}

// 누가 이겼는지 확인
func determineGameState(playerHand: Hand, computerHand: Hand) -> GameState {
    var gameState:GameState = .lose
    if playerHand == computerHand { gameState = .draw }
    switch playerHand {
    case .scissors:
        if computerHand == .paper { gameState = .win }
    case .rock:
        if computerHand == .scissors { gameState = .win }
    case .paper:
        if computerHand == .rock { gameState = .win }
    default:
        printInputError()
        playRockPaperScissorsGame()
    }
    return gameState
}

// 컴퓨터의 패를 결정하고, 사용자의 패를 입력받은 후 비교하고 출력
func playRockPaperScissorsGame() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")

    var gameState: GameState = .draw
    var player: Hand = .empty
    guard let computer: Hand = Hand(rawValue: Int.random(in: 1...3)) else {
        printInputError()
        playRockPaperScissorsGame()
        return
    }
    guard let input = readLine() else {
        printInputError()
        playRockPaperScissorsGame()
        return
    }
    
    if input == "0" {
        print("게임 종료")
        return
    }
    if let inputNumber = Int(input) {
        if inputNumber >= 1 && inputNumber <= 3 { player = Hand(rawValue: inputNumber)! }
    } else {
        printInputError()
        playRockPaperScissorsGame()
        return
    }

    gameState = determineGameState(playerHand: player, computerHand: computer)
    print(gameState.rawValue)
    // 비긴 경우 새로 시작
    if gameState == .draw { playRockPaperScissorsGame() }
    else { playMukchibaGame(rpsState: gameState) }
    return
}

func playMukchibaGame(rpsState: GameState) {
    var gameState: GameState = rpsState
    var winnerState: WinnerState = .empty
    if gameState == .win { winnerState = .player }
    else if gameState == .lose { winnerState = .computer }
    
    while true {
        print("[\(winnerState.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
        var player: Hand
        guard let computer: Hand = Hand(rawValue: Int.random(in: 1...3)) else { return }
        guard let input = readLine() else {
            printInputError()
            continue
        }
        
        if input == "0" {
            print("게임 종료")
            return
        } else if input == "1" { player = .rock }
        else if input == "2" { player = .scissors }
        else if input == "3" { player = .paper }
        else {
            printInputError()
            continue
        }
        
        gameState = determineGameState(playerHand: player, computerHand: computer)
        if gameState == .draw {
            print("\(winnerState.rawValue)의 승리!")
            break
        }
        if gameState == .win { winnerState = .player }
        else if gameState == .lose { winnerState = .computer }
        print("\(winnerState.rawValue)턴 입니다.")
    }
}

playRockPaperScissorsGame()
