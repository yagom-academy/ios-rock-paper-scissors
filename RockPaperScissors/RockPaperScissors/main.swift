//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var myCard = Card()
var partnerCard = Card()
var currentTurn = Turn.사용자

// 가위바위보 게임
func playRoundOne(){
    while(true){
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator:"")
        let myCardIdx = Int(readLine()!) ?? -1
        
        guard myCardIdx != 0 else {
            print("게임 종료")
            return
        }
        
        if myCardIdx < 1 || myCardIdx > 3 {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        myCard.cardIdx = myCardIdx
        partnerCard.cardIdx = Int.random(in: 1...3)
        
        print(myCard.cardIdx, partnerCard.cardIdx)
        
        if myCard.cardIdx != partnerCard.cardIdx{
            if myCard.playGame(myCard.cardIdx,partnerCard.cardIdx){
                currentTurn = Turn.사용자
                print("이겼습니다!")
            }else{
                currentTurn = Turn.컴퓨터
                print("졌습니다!")
            }
            playRoundTwo()
            return
        }else{
            print("비겼습니다!")
        }
    }
}

func playRoundTwo(){
    print("묵찌빠 게임 시작")
  
    while(true){
        print("[\(currentTurn)턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ",terminator:"")
        
        let myCardIdx = Int(readLine()!) ?? -1
        
        guard myCardIdx != 0 else {
            print("게임 종료")
            return
        }
        
        if myCardIdx < 1 || myCardIdx > 3 {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        myCard.cardIdx = myCardIdx
        partnerCard.cardIdx = Int.random(in: 1...3)
        
        print(myCard.cardIdx, partnerCard.cardIdx)
        
        if myCard.cardIdx != partnerCard.cardIdx{
            if myCard.playGame(partnerCard.cardIdx,myCard.cardIdx){
                currentTurn = Turn.사용자
            }else{
                currentTurn = Turn.컴퓨터
            }
        }else{
            print("\(currentTurn)의 승리!")
            return
        }
    }
}
//
playRoundOne()



