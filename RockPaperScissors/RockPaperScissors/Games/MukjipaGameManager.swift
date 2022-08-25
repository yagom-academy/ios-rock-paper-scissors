//
//  MukjipaGameManager.swift
//  Created by Wonbi, 미니
//


class MukjipaGameManager {
    var isUserTurn: Bool = true
    private var attacker: String {
        isUserTurn ? "사용자" : "컴퓨터"
    }
    
    func selectTurn(from result: GameState) {
        isUserTurn = (result == .win)
    }
    
    private func fetchUserInput() -> Result<RPS, InputError> {
        print("[\(attacker) 턴]", "묵(1), 찌(2), 빠(3)! <종료 : 0> : ", separator: " ", terminator: "")
        
        guard let inputValue = readLine(),
              let inputNumber = Int(inputValue),
              0...3 ~= inputNumber else { return .failure(.invalidNumber) }
        
        if let inputCard = RPS(rawValue: inputNumber) {
            return .success(inputCard)
        } else {
            return .failure(.invalidNumber)
        }
    }
}
