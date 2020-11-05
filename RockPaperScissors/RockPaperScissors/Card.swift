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
    
    //승패결정
    func playGameOne(_ idx1: Int, _ idx2: Int) -> Bool{
        if idx1 == 1{
            if idx2 == 2 {
                return false
            }else{
                return true
            }
        }
        if idx1 == 2{
            if idx2 == 3 {
                return false
            }else{
                return true
            }
        }
        if idx1 == 3{
            if idx2 == 1 {
                return false
            }else{
                return true
            }
        }
        return true
    }
    
//    func playGameTwo(_ idx1: Int, _ idx2: Int) -> Bool{
//    }

}


