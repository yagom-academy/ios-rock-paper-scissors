//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 고정 출력문
let order: [String : String] = [
    "SRP" : "가위(1), 바위(2), 보(3)! <종료: 0> : ",
    "RSP" : "묵(1), 찌(2), 빠(3)! <종료: 0> : "
]

enum Gamer : String {
    case user = "사용자"
    case computer = "컴퓨터"
    // 비겼음
    case draw
}

// 손 상태
enum Hand {
    case rock, scissor, paper, empty
}

// error 메시지
enum Msg : String {
    case errorPrint = "시스템 에러로 인해 다시 시도해주세요."
    case errorInput = "잘못된 입력입니다. 다시 시도해주세요."
    case exit = "게임을 종료합니다."
}

var computerHand: Hand = .empty
var userHand: Hand = .empty
// 게임 턴
var gameTurn: Gamer = .draw

func turnMessage(_ turn: Gamer) -> String {
    switch turn {
    case .computer:
        return "[컴퓨터 턴] "
    case .user:
        return "[사용자 턴] "
    default:
        return ""
    }
}

func winMessage(_ turn: Gamer) -> String {
    switch turn {
    case .computer:
        return "컴퓨터의 승리!"
    case .user:
        return "사용자의 승리!"
    default:
        return ""
    }
}

func nextTurnMessage(_ nextTurn: Gamer) -> String {
    switch nextTurn {
    case .computer:
        return "컴퓨터의 턴입니다"
    case .user:
        return "사용자의 턴입니다"
    default:
        return ""
    }
}

// 게임에서 이긴 Gamer return
func game(user: Hand, computer: Hand) -> Gamer {
    // 비겼음
    if user == computer {
        return Gamer.draw
    }
    
    switch user {
    case .rock:
        if computer == .paper {
            return Gamer.computer
        }
        return Gamer.user
    case .scissor:
        if computer == .rock {
            return Gamer.computer
        }
        return Gamer.user
    case .paper:
        if computer == .scissor {
            return Gamer.computer
        }
        return Gamer.user
    case .empty:
        return Gamer.draw
    }
}

func SRPNumberToHand(_ number: Int) -> Hand {
    switch number {
    case 1:
        return Hand.scissor
    case 2:
        return Hand.rock
    case 3:
        return Hand.paper
    default:
        return Hand.empty
    }
}

func RSPNumberToHand(_ number: Int) -> Hand {
    switch number {
    case 1:
        return Hand.rock
    case 2:
        return Hand.paper
    case 3:
        return Hand.scissor
    default:
        return Hand.empty
    }
}

// 게임 종료
var exit = false

// 가위바위보 게임
func gameSRP() {
    while !exit {
        guard let order = order["SRP"] else {
            print(Msg.errorPrint.rawValue)
            continue
        }
        print(order)
        
        // 잘못된 입력이라면 메세지 출력 후 다시 입력 받기
        guard let input = readLine() else {
            print(Msg.errorInput.rawValue)
            continue
        }
        
        if let number = Int(input),
           number >= 0 && number <= 3 {
            // 게임 종료
            if number == 0 {
                print(Msg.exit.rawValue)
                exit = true
                return
            }
            
            userHand = SRPNumberToHand(number)
            computerHand = SRPNumberToHand(Int.random(in: 1...3))
            
            gameTurn = game(user: userHand, computer: computerHand)
            // 비긴 경우는 다시 게임
            if gameTurn == .draw {
                print("비겼습니다!")
                continue
            }
            
            // 이기거나 진 경우는 묵찌빠로 가야하므로 탈출
            if gameTurn == .user {
                print("이겼습니다!")
            }
            else {
                print("졌습니다!")
            }
            return
        }
        else {
            print(Msg.errorInput.rawValue)
        }
    }
    
}

// 묵찌빠 게임
func gameRSP() {
    while !exit {
        guard let order = order["RSP"] else {
            print(Msg.errorPrint.rawValue)
            continue
        }
        
        print(turnMessage(gameTurn) + order)
        
        // 잘못된 입력이라면 메세지 출력 후 다시 입력 받기
        guard let input = readLine() else {
            print(Msg.errorInput.rawValue)
            continue
        }
        
        if let number = Int(input),
           number >= 0 && number <= 3 {
            if number == 0 {
                print(Msg.exit.rawValue)
                exit = true
                return
            }
            
            userHand = RSPNumberToHand(number)
            computerHand = RSPNumberToHand(Int.random(in: 1...3))
            
            let nextTurn = game(user: userHand, computer: computerHand)
            // 패가 동일하다면 현재 턴인 사람이 승리
            if nextTurn == .draw {
                print(winMessage(gameTurn))
                exit = true
                return
            }
            
            gameTurn = nextTurn
            print(nextTurnMessage(gameTurn))
        }
        else {
            print(Msg.errorInput.rawValue)
        }
    }
}


func gameStart() {
    gameSRP()
    
    if exit {
        return
    }
    
    gameRSP()
}

gameStart()
