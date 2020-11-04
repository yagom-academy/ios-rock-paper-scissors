//
//  Card.swift
//  RockPaperScissors
//
//  Created by 강인희 on 2020/11/04.
//

import Foundation
struct Card{
    var cardIdx: Int
    var isMyTurn: Bool
    
    init() {
        self.cardIdx = 0
        self.isMyTurn = true
    }
    
//    func changeCard(_ newCard:Int){
//        self.cardIdx = newCard
//    }
    
    //승패결정
    func didWin(_ myCardIdx: Int, _ partnerCardIdx: Int) -> Bool{
        if partnerCardIdx == (myCardIdx + 1) % 3 {
            //1 2 3
            //1 2 3
            
            // 1 > 2 > 3 > 1 묵 찌
            return true
        }
        return false
    }
}
