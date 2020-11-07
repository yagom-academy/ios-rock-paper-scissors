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

enum GameName{
    case 가위바위보
    case 묵찌빠
}

/// 가위바위보 or 묵찌빠 게임 시작 시, 입력값 처리 함수
///
/// - Returns: -1 또는 0 또는 1~3 (-1은 잘못된 입력, 0은 게임 종료, 1~3은 사용자 패)
func takePlayerInput() -> Int {
    
    let inputNum = Int(readLine()!) ?? -1
    
    guard inputNum != 0 else {
        print("게임 종료")
        return 0
    }
    
    guard 0 < inputNum, inputNum <= 3 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return -1
    }
    
    return inputNum
}

/// 가위바위보 게임 함수
///
/// 가위바위보 게임을 진행하며, 승부가 나면 묵찌빠 게임 함수를 실행.
func playRockScissorPaper() {
    while(playerCard.cardIdx == computerCard.cardIdx) {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        let input = takePlayerInput()
        
        /// 입력값 받는 함수의 return값에 따른 상황 처리
        switch input {
        case -1:
            continue
        case 0:
            return
        default:
            /// 사용자의 카드패 설정
            playerCard.cardIdx = input
            /// 컴퓨터의 카드패 설정
            computerCard.cardIdx = Int.random(in: 1...3)
        }
        
        /// 승패가 결정되는 경우 (묵찌빠 게임으로 이동)
        if playerCard.cardIdx != computerCard.cardIdx {
            /// true면 player가 이김
            if playerCard.didWin(against: computerCard.cardIdx, on: .가위바위보) {
                /// 사용자 차례로 묵찌빠 시작
                currentTurn = Turn.사용자
                print("이겼습니다!")
                /// false면 computer가 이김
            } else {
                /// 컴퓨터 차례로 묵찌빠 시작
                currentTurn = Turn.컴퓨터
                print("졌습니다!")
            }
            return
        }
        print("비겼습니다!")
    }
}

/// 묵찌빠 게임 함수
///
/// 가위바위보 게임 함수에서 실행하며, 가위바위보와 카드 패가 다르다.
/// 가위 - 1, 바위 - 2, 보 - 3 이지만 묵 - 1, 찌 - 2, 빠 - 3 이다. 묵찌빠에서는 가위 바위의 패가 서로 바뀐다.
/// 그래서 승부 판정 함수에 가위바위보와 달리 입력값의 순서를 바꿔서 실행한다.
func playMukChiPpa() {
    print("묵찌빠 게임 시작")
    while(playerCard.cardIdx != computerCard.cardIdx) {
        /// currentTurn이 게임 진행에 따라 계속 업데이트됨
        print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        let input = takePlayerInput()
        
        switch input {
        case -1:
            continue
        case 0:
            return
        default:
            playerCard.cardIdx = input
            computerCard.cardIdx = Int.random(in: 1...3)
        }
        /// 랜덤값 뭐들어갔는지 확인용
        print(playerCard.cardIdx, computerCard.cardIdx)
        
        /// 패가 다를 경우, 게임계속진행되고 turn은 게임결과에따라 바뀜
        if playerCard.cardIdx == computerCard.cardIdx {
            /// 패가 같은 경우 currentTurn이 이기고 게임종료
            print("\(currentTurn)의 승리!")
            return
        }
           /// true면 사용자 차례  false면 컴퓨터 차례
        currentTurn = playerCard.didWin(against: computerCard.cardIdx, on: .묵찌빠) ? Turn.사용자 : Turn.컴퓨터
    }
}

func playGame(){
    /// 가위바위보 실행
    playRockScissorPaper()
    /// 묵찌빠 실행
    playMukChiPpa()
}

playGame()

