//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct GameManager {
    var computerHandShape: HandShape? {
        get {
            HandShape.init(rawValue: Int.random(in: 1...3))
        }
    }
    var userHandShape: HandShape?
        
    func receiveHandShapeFromUser() -> HandShape? {
        printRockPaperScissorsManual()
        let userInput = receiveInputFromUser()
        guard let convertedInput = Int(userInput) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return receiveHandShapeFromUser()
        }
        
        switch convertedInput {
        case 1...3:
            return HandShape.init(rawValue: convertedInput)
        case 0:
            return nil
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return receiveHandShapeFromUser()
        }
    }
    
    func printRockPaperScissorsManual() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func receiveInputFromUser() -> String {
        guard let input = readLine() else { return "" }
        return input
    }
}
