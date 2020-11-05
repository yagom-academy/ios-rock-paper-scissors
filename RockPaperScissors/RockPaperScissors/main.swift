//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//player와 computer의 패(카드) 생성
var playerCard = Card()
var computerCard = Card()
var currentTurn = Turn.사용자

// 가위바위보 or 묵찌빠 게임 시작 시, 입력값에 따른 처리
func getPlayerInput()->Int{
    let inputNum = Int(readLine()!) ?? -1
    
    guard inputNum != 0 else {
        print("게임 종료")
        return 0
    }
    
    guard 0<inputNum,inputNum<=3 else{
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return -1
    }
    
    return inputNum
    
}

func playRoundOne(){
    while(true){
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator:"")
        
        let input = getPlayerInput()
        
        //입력값 받는 함수의 return값에 따른 상황 처리
        switch input{
        case -1:
            continue
        case 0:
           return
        default:
            playerCard.cardIdx = input // 사용자의 카드패 설정
            computerCard.cardIdx = Int.random(in: 1...3) // 컴퓨터의 카드패 설정
        }
        
        print(playerCard.cardIdx, computerCard.cardIdx) // 랜덤값 뭐들어갔는지 확인용
        
        if playerCard.cardIdx != computerCard.cardIdx{ //승패가 결정되는 경우 (묵찌빠 게임으로 이동)
            if playerCard.playGame(playerCard.cardIdx,computerCard.cardIdx){ //true면 player가 이김
                currentTurn = Turn.사용자 //사용자 차례로 묵찌빠 시작
                print("이겼습니다!")
            }else{//false면 computer가 이김
                currentTurn = Turn.컴퓨터 //컴퓨터 차례로 묵찌빠 시작
                print("졌습니다!")
            }
            playRoundTwo() //묵찌빠 게임하러
            return //묵찌빠끝나면 아예 종료
        }else{ // 비길 경우 게임 계속 진행
            print("비겼습니다!")
        }
    }
}

func playRoundTwo(){
    print("묵찌빠 게임 시작")
    
    while(true){
        print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ",terminator:"") //currentTurn이 게임 진행에 따라 계속 업데이트됨
        
        let input = getPlayerInput() // 가위바위보의 입력값 처리 과정과 동일
        
        switch input{
        case -1:
            continue
        case 0:
            exit(0)
        default:
            playerCard.cardIdx = input
            computerCard.cardIdx = Int.random(in: 1...3)
        }
        
        print(playerCard.cardIdx, computerCard.cardIdx) // 랜덤값 뭐들어갔는지 확인용
        
        if playerCard.cardIdx != computerCard.cardIdx{ // 패가 다를 경우, 게임계속진행되고 turn은 게임결과에따라 바뀜
            currentTurn = playerCard.playGame(computerCard.cardIdx, playerCard.cardIdx) ? Turn.사용자 : Turn.컴퓨터 //true면 사용자이김 false면 컴퓨터이김
        }else{ //패가 같은 경우 currentTurn이 이기고 게임종료
            print("\(currentTurn)의 승리!")
            return
        }
    }
}

playRoundOne() //가위바위보 실행



