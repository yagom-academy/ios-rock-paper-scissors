//
//  MukjipaGameModel.swift
//  RockPaperScissors
//
//  Created by Derrick kim on 2022/04/22.
//

import Foundation

final class MukjipaGameModel {
    private var rockPaperSicissors = RockPaperScissorsGameModel()
    private var player: Player?
    private var result: Bool = true
    
    init(player: Player) {
        self.player = player
    }
}

extension MukjipaGameModel {
    func start() {
        
        
        while result {
            let selectionList: String = "[\(player?.rawValue ?? "") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
            selectionList.printSelf()
            
            let user: Mukjjipa = conveyType(from: selectionList.chooseValue() ?? 0)
            result = compare(of: createComputerValue(), and: user)
        }
    }
}

private extension MukjipaGameModel {
    func conveyType(from value: Int) -> Mukjjipa {
        guard let mukjipaType = Mukjjipa(rawValue: value) else {
            player = .computer
            restart(as: "잘못된 입력입니다. 다시 시도해주세요.")
            return .none
        }
        return mukjipaType
    }
    
    func restart(as quote: String) {
        print(quote)
        start()
    }
    
    func createComputerValue() -> Mukjjipa {
        let computer = Mukjjipa(rawValue: Int.random(in: 1...3)) ?? .none
        return computer
    }
    
    func compare(of computer: Mukjjipa?, and user: Mukjjipa?) -> Bool {
        if computer == user {
            print("\(player?.rawValue ?? "")의 승리!")
            print("게임종료")
            return false
        } else {
            print("\(player?.rawValue ?? "")의 턴입니다.")
            rockPaperSicissors.compare(of: computer?.convert(), and: user?.convert())
            return true
        }
    }
}
