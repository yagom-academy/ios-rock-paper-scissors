//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var myCard = Card()
var partnerCard = Card()

// 가위바위보 게임
func playRoundOne(){
    while(true){
        // 가위바위보 진행 안내
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        // 가위바위보 사용자 입력
        if let input = readLine() {
            // 유효한 입력값인지 판정
            guard let myCardIdx = Int(input), 0 <= myCardIdx && myCardIdx <= 3 else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            // 가위바위보 종료
            if myCardIdx == 0 {
                return
            }
            
            myCard.cardIdx = myCardIdx
            // 컴퓨터 입력값 랜덤으로 초기화
            partnerCard.cardIdx = Int.random(in: 1...3)
            
            if myCard.cardIdx != partnerCard.cardIdx{
                if myCard.didWin(myCard.cardIdx,partnerCard.cardIdx){
                    print("이겼습니다!")
                    myCard.isMyTurn = true
                } else {
                    print("졌습니다!")
                    myCard.isMyTurn = false
                }
//                playRoundTwo() //묵찌빠
            } else {
                print("비겼습니다!")
            }
        }
    }
}

func playRoundTwo(){
    
}


playRoundOne()
//()//가위바위보


