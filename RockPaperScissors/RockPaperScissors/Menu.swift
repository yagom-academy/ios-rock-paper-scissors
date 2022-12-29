//
//  Menu.swift
//  RockPaperScissors
//
//  Created by 강민수 on 2022/12/29.
//

enum Menu {
    case normal
    case advanced
    
    var rock: Int {
        switch self {
        case .normal:
            return 2
        case .advanced:
            return 1
        }
    }
    
    var scissors: Int {
        switch self {
        case .normal:
            return 1
        case .advanced:
            return 2
        }
    }
    
    var end: Int {
        return 0
    }
    
    var paper: Int {
        return 3
    }
}
