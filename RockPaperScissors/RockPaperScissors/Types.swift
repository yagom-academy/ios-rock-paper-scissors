//
//  Types.swift
//  RockPaperScissors
//
//  Created by Kyungmin Lee on 2020/11/09.
//

import Foundation

enum GameTurn: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

enum GameResult {
    case win
    case draw
    case lose
}

enum Hand {
    case scissors
    case rock
    case paper
    
    /// 가위바위보 넘버링
    static func scissorsRockPaper(number: Int) -> Hand? {
        switch number {
        case 1:
            return .scissors
        case 2:
            return .rock
        case 3:
            return .paper
        default:
            return nil
        }
    }
    
    /// 묵찌빠 넘버링
    static func rockScissorsPaper(number: Int) -> Hand? {
        switch number {
        case 1:
            return .rock
        case 2:
            return .scissors
        case 3:
            return .paper
        default:
            return nil
        }
    }
    
    /// 가위바위보 결과 판정
    func decideScissorsRockPaperResult(otherHand: Hand) -> GameResult {
        switch self {
        case .scissors:
            return (otherHand == .paper) ? .win : .lose
        case .rock:
            return (otherHand == .scissors) ? .win : .lose
        case .paper:
            return (otherHand == .rock) ? .win : .lose
        }
    }
    
    /// 묵찌빠 결과 판정
    func decideRockScissorsPaperResult(otherHand: Hand, gameTurn: GameTurn) -> GameResult {
        
        // 패가 동일하면 턴 쥐고 있는 쪽이 승리
        guard self != otherHand else {
            if gameTurn == .user {
                //print("사용자의 승리")
                return .win
            } else {
                //print("컴퓨터의 승리")
                return .lose
            }
        }
        
        // 패가 다르면 그냥 넘어가고 가위바위보로 판별
        return .draw
    }
}
