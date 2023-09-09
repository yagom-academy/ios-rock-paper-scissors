//
//  CurrentTurn.swift
//  Created by uemu, mireu.
//  Copyright © yagom academy. All rights reserved.
//

enum CurrentTurn: CustomStringConvertible {
    case user
    case computer
    
    var description: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        }
    }
}
