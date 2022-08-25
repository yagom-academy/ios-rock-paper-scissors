//
//  RockPaperScissors - HandShape.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum HandShape: Int {
    enum Option {
        case rockPaperScissors, mukJjiBba
    }
    
    case scissors = 1, rock = 2, paper = 3
    
    init?(rawValue: Int, option: HandShape.Option) {
        if option == .mukJjiBba {
            switch rawValue {
            case 1:
                self = .rock
            case 2:
                self = .scissors
            case 3:
                self = .paper
            default:
                return nil
            }
        } else {
            self.init(rawValue: rawValue)
        }
    }
}
