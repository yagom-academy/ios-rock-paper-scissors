//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 플레이어 승리 상태
enum PlayerIs: String {
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

// 누가 승리했는지
enum WinnerIs: String {
    case player = "사용자"
    case computer = "컴퓨터"
    case empty
}

// 플레이어 상태에 대한 전역변수
var playerIs: PlayerIs = .draw

// 입력 에러 출력 및 가위바위보 게임 재시작
func printInputErrorAndResartRPSGame() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
    playRockPaperSsissorsGame()
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
        printInputErrorAndResartRPSGame()
    }
}

// 컴퓨터의 패를 결정하고, 사용자의 패를 입력받은 후 비교하고 출력
func playRockPaperScissorsGame() -> Bool {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    
    var player: Hand = .empty
    guard let computer: Hand = Hand(rawValue: Int.random(in: 1...3)) else { 
        playRockPaperScissorsGame()
        return true // 1. 여기를 false로 해야하는 건지.. true로 해야하는 건지 모르겠어요
    }
    guard let input = readLine() else {
        printInputErrorAndResartRPSGame()
        return true // 2. 여기랑
    }
    
    if input == "0" {
        print("게임 종료")
        return false
    }
    if let inputNumber = Int(input) {
        if inputNumber >= 1 && inputNumber <= 3 {
            player = Hand(rawValue: inputNumber)!
        }
    } else {
        printInputErrorAndResartRPSGame()
        return true // 3. 여기도요! 다시 palyRockPaperScissorGame을 부르면, 순환? 함수같은 느낌인데, 
        // 마지막 true값이 다음 함수에 전달되는건지, 중간에 true가 전달되는건지 모르겠어요. 하지만 마지막 값이 전달된다고 생각하고 짰습니다!
    }
    
    print("player: \(player) vs computer: \(computer)") // 값 확인용 출력, 삭제 예정
    checkWhoIsWinner(player, vs: computer)
    print(playerIs.rawValue)
    // 비긴 경우 새로 시작
    if playerIs == .draw { playRockPaperScissorsGame() }
    return true
}

func palyMukchibaGame() {
    if !playRockPaperScissorsGame() { return }
    var winnerIs: WinnerIs = .empty
    if playerIs == .win { winnerIs = .player }
    else if playerIs == .lose { winnerIs = .computer }
    
    while true {
        print("[\(winnerIs.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
        var player: Hand = .empty
        guard let computer: Hand = Hand(rawValue: Int.random(in: 1...3)) else { return }
        guard let input = readLine() else {
            print("잘못된 입력입니다. 다시 입력해주세요.")
            continue
        }
        
        switch input {
        case "0":
            print("게임 종료")
            return
        case "1":
            player = .rock
        case "2":
            player = .scissors
        case "3":
            player = .paper
        default:
            print("잘못된 입력입니다. 다시 입력해주세요.")
            continue
        }
        
        print("player: \(player) vs computer: \(computer)") // 값 확인용 출력, 삭제 예정
        checkWhoIsWinner(player, vs: computer)
        if playerIs == .draw {
            print("\(winnerIs.rawValue)의 승리!")
            break
        }
        if playerIs == .win { winnerIs = .player }
        else if playerIs == .lose { winnerIs = .computer }
        print("\(winnerIs.rawValue)턴 입니다.")
    }
}

palyMukchibaGame()
