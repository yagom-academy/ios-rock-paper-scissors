//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// player와 computer의 패(카드) 생성
private var playerCard = Card()
private var computerCard = Card()
private var currentTurn = Turn.사용자

func makeAvailableValue(of playerInput: String?) -> Int {
    guard let rawInput = playerInput, let inputNumberized = Int(rawInput)  else {
        return -1
    }
    
    switch inputNumberized {
    case 0:
        return 0
    case 1...3:
        return inputNumberized
    default:
        return -1
    }
}
/// 가위바위보 게임 함수
///
/// 가위바위보 게임을 진행하며, 승부가 나면 묵찌빠 게임 함수를 실행.
func playRockScissorPaper() {
    while(playerCard.cardIdx == computerCard.cardIdx) {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let input = makeAvailableValue(of: readLine())
        
        /// 입력값 받는 함수의 return값에 따른 상황 처리
        switch input {
        case -1:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        case 0:
            return
        default:
            playerCard.cardIdx = input
            computerCard.cardIdx = Int.random(in: 1...3)
        }
        /// 승패가 결정되는 경우 (묵찌빠 게임으로 이동)
        if playerCard.cardIdx != computerCard.cardIdx {
            if playerCard.didWin(against: computerCard.cardIdx, on: .가위바위보) {
                currentTurn = Turn.사용자
                print("이겼습니다!")
            } else {
                currentTurn = Turn.컴퓨터
                print("졌습니다!")
            }
            playMukChiPpa()
            return
        }
        /// 비기는 경우 (가위바위보 게임 계속 진행)
        print("비겼습니다!")
    }
}

/// 묵찌빠 게임 함수
func playMukChiPpa() {
    print("묵찌빠 게임 시작")
    while(playerCard.cardIdx != computerCard.cardIdx) {
        /// currentTurn이 게임 진행에 따라 계속 업데이트됨
        print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        let input = makeAvailableValue(of: readLine())
        
        /// 입력값 받는 함수의 return값에 따른 상황 처리
        switch input {
        case -1:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        case 0:
            return
        default:
            playerCard.cardIdx = input
            computerCard.cardIdx = Int.random(in: 1...3)
        }
        if playerCard.cardIdx == computerCard.cardIdx {
            /// 패가 같은 경우 currentTurn이 이기고 게임종료
            print("\(currentTurn)의 승리!")
            return
        }
        /// 패가 다를 경우, 게임계속진행되고 turn은 게임결과에따라 바뀜
        currentTurn = playerCard.didWin(against: computerCard.cardIdx, on: .묵찌빠) ? Turn.사용자 : Turn.컴퓨터
    }
}

/// 가위바위보 실행
playRockScissorPaper()
