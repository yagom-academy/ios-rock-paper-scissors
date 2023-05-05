//
//  MukJjiBba.swift
//  RockPaperScissors
//
//  Created by Minseong Kang on 2023/05/05.
//

func playMukJjiBba() {
    var gameTurn = playRockScissorsPaper()
    
    while gameTurn != .gameEnd {
        typealias inputNumberGameTurn = (inputNumber: Int, gameTurn: GameTurn)
        let gameData: inputNumberGameTurn = inputNumberAtMukJiBba(with: gameTurn)
        
        if checkGameEnd(with: gameData.inputNumber) { return }
        
        let handShape = receiveHandShapeElement(index: gameData.inputNumber)
        guard let randomHandShape = generateRandomHandShape() else { continue }
        
        let gameResult = receiveGameResult(user: handShape, computer: randomHandShape)
        
        gameTurn = determinGameTurn(with: gameResult)
        
        determinVictory(with: gameTurn, and: gameData)
    }
    return
}

func inputNumberAtMukJiBba(with turn: GameTurn) -> (inputNumber: Int, gameTurn: GameTurn) {
    let isNotCorrectNumber = true
    var gameTurn = turn

    while isNotCorrectNumber {
        print("[\(gameTurn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")

        guard let userInput = readLine(),
              let covertUserInput = Int(userInput) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            gameTurn = .computer
            continue
        }
        guard (0...3).contains(covertUserInput) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            gameTurn = .computer
            continue
        }
        return (covertUserInput, gameTurn)
    }
}

func determinVictory(with gameTurn: GameTurn, and gameData: (inputNumber: Int, gameTurn: GameTurn)) {
    guard gameTurn == .gameEnd else {
        print("\(gameTurn.rawValue)의 턴입니다.")
        return
    }
    print("\(gameData.gameTurn.rawValue)의 승리!")
    return
}
