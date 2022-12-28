//  RockPaperScissors - ScissorsRockPaper.swift
//  Created by vetto, songjun on 2022.12.27

enum ScissorsRockPaper: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case wrongHand
}

enum MookZizBba: Int {
    case mook = 1
    case zzi = 2
    case bba = 3
}

enum Winner: String {
    case user = "사용자"
    case computer = "컴퓨터"
    case draw
}

enum Turn {
    case userTurn
    case computerTurn
}
