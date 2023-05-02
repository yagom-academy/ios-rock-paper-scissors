//
//  GameManager.swift
//  RockPaperScissors
//
//  Created by myungsun, Yetti on 2023/05/02.
//

class GameManager {
    func startGame() {
        let computerPlayer = Player(type: .computer)
        let userPlayer = Player(type: .person)
        let handShapes: [HandShape] = [.scissors, .rock, .paper]
        var isGameOn: Bool = true
        
        while isGameOn {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
            guard let gameOption = readLine(),
                  let gameOptionNumber = Int(gameOption) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            computerPlayer.makeRandomHandShape()
            guard let computerHandShape = computerPlayer.getCurrentHandShape() else { continue }
            
            switch gameOptionNumber {
            case 0:
                isGameOn = false
                print("게임 종료")
            case 1...3:
                let userHandShape = handShapes[gameOptionNumber-1]

            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
}
