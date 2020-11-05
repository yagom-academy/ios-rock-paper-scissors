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
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :",terminator:"")
        let myCardIdx = Int(readLine()!) ?? -1
        
        guard myCardIdx != 0 else {
            print("게임 종료")
            return
        }
        
        if myCardIdx == -1{
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        
        myCard.cardIdx = myCardIdx
        partnerCard.cardIdx = Int.random(in: 1...3)
        
        print(myCard.cardIdx, partnerCard.cardIdx)
        
        if myCard.cardIdx != partnerCard.cardIdx{
            if myCard.playGame(myCard.cardIdx,partnerCard.cardIdx){
                myCard.isMyTurn = true
                partnerCard.isMyTurn = false
                print("이겼습니다!")
            }else{
                myCard.isMyTurn = false
                partnerCard.isMyTurn = true
                print("졌습니다!")
            }
            //playRoundTwo()
            return
        }else{
            print("비겼습니다!")
        }
    }
}

//
playRoundOne()



