//
//  GameManager.swift
//  RockPaperScissors
//
//  Created by myungsun, Yetti on 2023/05/02.
//

class GameManager {
    func startGame() {
        let computer: GamePlayer = GamePlayer(type: .computer)
        let user: GamePlayer = GamePlayer(type: .person)
        let handShapes: [HandShape] = [.scissors, .rock, .paper]
        var isGameOn: Bool = true
        
        while isGameOn {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
            guard let gameOption = readLine(),
                  let gameOptionNumber = Int(gameOption) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            computer.makeRandomHandShape()
            guard let computerHandShape = computer.getCurrentHandShape() else { continue }
            
            switch gameOptionNumber {
            case 0:
                isGameOn = false
                print("게임 종료")
            case 1...3:
                let userHandShape = handShapes[gameOptionNumber - 1]
                let resultMessage = getGameResult(computerHandShape, userHandShape).1
                isGameOn = getGameResult(computerHandShape, userHandShape).0
                
                user.changeHandShape(to: userHandShape)
                print("\(resultMessage)")
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
    
    private func getGameResult(_ computerHandShape: HandShape, _ userHandShape: HandShape) -> (Bool, String) {
        if computerHandShape == userHandShape {
            return (true, "비겼습니다.")
        } else if (computerHandShape == .rock && userHandShape == .paper) ||
                    (computerHandShape == .paper && userHandShape == .scissors) ||
                    (computerHandShape == .scissors && userHandShape == .rock) {
            return (false, "이겼습니다!")
        } else {
            return (false, "졌습니다!")
        }
    }
}
