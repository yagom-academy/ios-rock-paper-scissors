//
//  MukjipaGameModel.swift
//  RockPaperScissors
//
//  Created by Derrick kim on 2022/04/22.
//

import Foundation

final class MukjipaGameModel {
    private var mukjjiba = Mukjjipa()
    private var rockPaperSicissors = RockPaperScissorsGameModel()
}

extension MukjipaGameModel {
    func start() {
        var result: Bool = true
        
        while result {
            let selectionList: String = "[\(mukjjiba.order?.rawValue ?? "") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
            selectionList.printSelf()
            
            let user: MukjjipaType = conveyType(from: selectionList.chooseValue() ?? 0)
            result = compare(of: createComputerValue(), and: user)
        }
    }
}

private extension MukjipaGameModel {
    func conveyType(from value: Int) -> MukjjipaType {
        guard let mukjipaType = MukjjipaType(rawValue: value) else {
            mukjjiba.order = .computer
            restart(as: "잘못된 입력입니다. 다시 시도해주세요.")
            return .none
        }
        return mukjipaType
    }
    
    func restart(as quote: String) {
        print(quote)
        start()
    }
    
    func createComputerValue() -> MukjjipaType {
        let computer = MukjjipaType(rawValue: Int.random(in: 1...3)) ?? .none
        return computer
    }
    
    func compare(of computer: MukjjipaType?, and user: MukjjipaType?) -> Bool {
        if computer == user {
            print("\(mukjjiba.order?.rawValue ?? "" )의 승리!")
            print("게임종료")
            return false
        } else {
            print("\(mukjjiba.order?.rawValue ?? "")의 턴입니다.")
            rockPaperSicissors.compare(of: computer?.convert(), and: user?.convert())
            return true
        }
    }
}
