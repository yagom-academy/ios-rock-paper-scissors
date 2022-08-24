//
//  MukjipaGameManager.swift
//  Created by Wonbi, 미니
//

// 1. 가위바위보 후 결과에 따라서 게임 진행
// 2. 선공을 결정
// 3. 사용자의 입력을 받는다.
// 4. 컴퓨터패 생성
// 5. 두개를 비교 후, 결과값을 판단 한다.
// 6. 같다면, 선공자 승리 아닐 경우, 게임을 다시 진행 (선공을 결정)

struct MukjipaGameManager {
    var isUserTurn: Bool = true
    var attacker: String {
        (isUserTurn ? "사용자" : "컴퓨터")
    }
    
	mutating func selectTurn(from result: GameState) {
		if result == .userWin {
			isUserTurn = true
		} else if result == .computerWin {
			isUserTurn = false
		}
    }
    
    private func fetchUserInput() -> Result<Mukjipa, InputError> {
		print("[\(attacker) 턴]", GameMessage.mukjipaGame, separator: " ", terminator: " : ")
		
        guard let inputValue = readLine(),
              let inputNumber = Int(inputValue),
              0...3 ~= inputNumber else { return .failure(.invalidNumber) }
        
        if let inputCard = Mukjipa(rawValue: inputNumber) {
            return .success(inputCard)
        } else {
            return .failure(.invalidNumber)
        }
    }
	
	private func checkValidity(of userInputResult: Result<Mukjipa, InputError>) -> GameState {
		switch userInputResult {
		case .success(let inputCard):
			return inputCard.generateGameResult()
		case .failure:
			return .error
		}
	}
	
	mutating func startGame(from result: GameState) -> GameState {
		selectTurn(from: result)
		let userCard = fetchUserInput()
		let result = checkValidity(of: userCard)
		
		if result == .computerWin || result == .userWin {
			selectTurn(from: result)
			print(attacker + "의 턴입니다.")
		}
		
		return result
	}
}
