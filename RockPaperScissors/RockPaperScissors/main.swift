//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

print("Hello,World!")


var myCard = Card()
var partnerCard = Card()

func playRoundOne(){
    while(true){
        let myCardIdx = Int(readLine()!)!
        myCard.cardIdx = myCardIdx
        partnerCard.cardIdx = 1 //1,2,3 중 랜덤값 고르기
        if myCard.cardIdx != partnerCard.cardIdx{
            if myCard.didWin(myCard.cardIdx,partnerCard.cardIdx){
                myCard.isMyTurn = true
            }else{
                myCard.isMyTurn = false
            }
            playRoundTwo() //묵찌빠
            return
        }
        
    }
}

func playRoundTwo(){
    
}


playRoundOne()
//()//가위바위보


