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
}

// 가위, 바위, 보
enum Hand: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

// 누가 승리했는지
enum WinnerState: String {
    case player = "사용자"
    case computer = "컴퓨터"
}

// 어떤 게임을 진행하는지
enum SelectGame {
    case rockPaperScissors
    case mukchiba
}

class MukchibaGame {
    var gameState: GameState = .draw
    var winner: WinnerState = .player
    var player: Hand = .rock
    var computer: Hand = .rock
    var continueGame: Bool = true
    
    // input에러 출력
    func printInputError() {
        print("잘못된 입력입니다. 다시 입력해주세요.")
    }
    
    // 컴퓨터의 패를 랜덤으로 생성
    func makeComputerHand() -> Hand {
        let randomNumber = Int.random(in: 1...3)
        guard let computerHand: Hand = Hand(rawValue: randomNumber) else { return .rock }
        return computerHand
    }
    
    // 누가 이겼는지 확인
    func determineGameState(playerHand: Hand, computerHand: Hand) {
        gameState = .lose
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
        return
    }
    
    // 게임 상황에 따라 누가 승자인지
    func changeWinner() {
        if gameState == .win { winner = .player }
        else if gameState == .lose { winner = .computer }
    }
    
    // 메뉴 출력
    func printMenu(in place: SelectGame) {
        if place == .rockPaperScissors {
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
        } else {
            print("[\(winner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
        }
    }
    
    // 메뉴 출력-> 컴퓨터 패 생성 -> 인풋처리 -> 승자 확인 -> 출력 -> 종료 혹은 재실행
    func playRockPaperScissorsGame() {
        printMenu(in: .rockPaperScissors)
        computer = makeComputerHand()
        
        guard let input = readLine() else {
            printInputError()
            playRockPaperScissorsGame()
            return
        }
        
        switch input {
        case "0":
            print("게임 종료")
            continueGame = false
            return
        case "1":
            player = .scissors
        case "2":
            player = .rock
        case "3":
            player = .paper
        default:
            printInputError()
            playRockPaperScissorsGame()
            return
        }
        
        determineGameState(playerHand: player, computerHand: computer)
        print(gameState.rawValue)
        if gameState == .draw { playRockPaperScissorsGame() }
        return
    }
    
    // 가위바위보 실행 -> 선 확인 -> 메뉴 출력 -> 컴퓨터 패 처리 -> 인풋처리 -> 승자확인 -> 출력 -> 종료 혹은 선 확인 후 재실행
    func playMukchibaGame() {
        playRockPaperScissorsGame()
        changeWinner()
       
        while continueGame {
            printMenu(in: .mukchiba)
            computer = makeComputerHand()
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
            
            determineGameState(playerHand: player, computerHand: computer)
            if gameState == .draw {
                print("\(winner.rawValue)의 승리!")
                break
            }
            changeWinner()
            print("\(winner.rawValue)턴 입니다.")
        }
    }
}

func main() {
    var mukchibaGame = MukchibaGame()
    mukchibaGame.playMukchibaGame()
}

main()
