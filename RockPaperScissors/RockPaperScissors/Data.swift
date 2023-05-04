//
//  Data.swift
//  RockPaperScissors
//
//  Created by EtialMoon & Serena on 2023/05/02.
//

var winner: String = ""

enum HandOptions: String, CaseIterable {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

enum MukJjiPaOptions: String, CaseIterable {
    case muk = "1"
    case jji = "2"
    case pa = "3"
}
