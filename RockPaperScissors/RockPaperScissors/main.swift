//
//  RockPaperScissors - main.swift
//  Created by Wonbi, 미니
//

class GameManager {
	private let rpsGame = RPSGameManager()

	func startConsole() {
		let result = rpsGame.startGame()

		print(result.description)

		switch result {
		case .draw:
			startConsole()
		case .error:
			startConsole()
		case .exit:
			return
		default:
			print("묵찌빠 행이다.")
		}
	}
}

let game = GameManager()
game.startConsole()

// 1. 가위바위보 후 결과에 따라서 게임 진행
// 2. 선공을 결정
// 3. 사용자의 입력을 받는다.
// 4. 컴퓨터패 생성
// 5. 두개를 비교 후, 결과값을 판단 한다.
// 6. 같다면, 선공자 승리 아닐 경우, 게임을 다시 진행 (선공을 결정)
