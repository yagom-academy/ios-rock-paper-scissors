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
    
    // 가위바위보 승패결정
    func didWin(_ myCardIdx: Int, _ partnerCardIdx: Int) -> Bool{
        let difference = myCardIdx - partnerCardIdx
        
        if abs(difference) == 1 {
            if difference > 0 {
                return true
            } else {
                return false
            }
        } else { // {가위(1), 보(3)} or {보(3), 가위(1)}
            if difference < 0 { // {가위(1), 보(3)}
                return true
            } else { // {보(3), 가위(1)}
                return false
            }
        }
    }
}
