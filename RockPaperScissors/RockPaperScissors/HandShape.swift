//
//  RockPaperScissors - HandShape.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum HandShape: Int {
    case scissors = 1, rock, paper
    
    func isWin(comparing another: HandShape) -> Bool {
        return abs(self.rawValue - another.rawValue) == 1 ? self.rawValue > another.rawValue : self.rawValue < another.rawValue
    }
}
