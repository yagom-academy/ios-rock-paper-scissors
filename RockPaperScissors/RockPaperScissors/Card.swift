//
//  Card.swift
//  RockPaperScissors
//
//  Created by 강인희 on 2020/11/04.
//

import Foundation

struct Card{
    /// 카드패
    var cardIdx: Int
    /// 승패결정확인용 배열
    let checkWinOrLose = [2,3,1]
    
    init() {
        self.cardIdx = 0
    }
    
    /// 두개의 카드 패를 넣으면 승부를 판정
    ///
    /// 해당 함수로 가위바위보 실행시, 호출한 구조체Card 본인의 입장에서 idx1에 본인의 idx, idx2에 상대방의 idx를 넣으면 이겼을 때 true를 리턴, 졌을 때 false를 리턴한다.
    /// 해당 함수로 묵찌빠 실행시, 호출한 구조체Card 본인의 입장에서 idx1에 상대방의 idx, idx2에 본인의 idx를 넣으면 이겼을 때 true를 리턴, 졌을 때 false를 리턴한다.
    /// 가위바위보, 묵찌빠의 승패상관관계를 고려하여 하나의 게임실행함수로 만들고자 했고, 게임이 어떤 것이냐에 따라 파라미터가 (나의 idx, 상대방의 idx) 혹은 (상대방의 idx, 나의 idx) 가 들어갈 수 있기에 파라미터명은 idx1,idx2로 만들었다.
    /// 승패를 확인하기 위해서 winOrLose 배열을 사용하고 배열의 index와 idx1을 매칭시키고, 배열의 value와 idx2를 매칭시켜 승패상관관계를 확인한다.
    ///
    /// - Parameter idx1 : 사용자 또는 컴퓨터 카드패 (가위바위보시, idx1은 사용자/묵찌빠시, idx1은 컴퓨터)
    /// - Parameter idx2 : 사용자 또는 컴퓨터 카드패 (가위바위보시, idx2은 컴퓨터/묵찌빠시, idx2은 사용자)
    ///
    /// - Returns: True or False (사용자 승 또는 사용자 패)
    func playGame(_ idx1: Int, _ idx2: Int) -> Bool{
        if checkWinOrLose[idx1-1] == idx2{
            return false
        }else{
            return true
        }
    }
}


