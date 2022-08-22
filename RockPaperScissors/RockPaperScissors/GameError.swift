//
//  RockPaperScissors - GameError.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum GameError: Error {
    case isEmptyComputerHandShape
    case isEmptyUserHandShape
    
    func printErrorMessage(of error: GameError) {
        switch error {
        case .isEmptyComputerHandShape:
            print("컴퓨터의 패가 비어있습니다.")
        case .isEmptyUserHandShape:
            print("사용자의 패가 비어있습니다.")
        }
    }
}
