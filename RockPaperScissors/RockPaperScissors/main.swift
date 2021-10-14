//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
enum RockPaperScissors: Int {
    case scissor = 1
    case rock
    case paper
    
    var assignedValue : Int {
        return self.rawValue
    }
}

func getUserInput() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
        return -1
    }
    return userInputNumber
}

func generateRandomNumber() -> Int {
    var handsOfComputer: [RockPaperScissors] = [.scissor,.rock,.paper]
    let randomIndex = 0
    
    handsOfComputer.shuffle()
    var handOfComputer = handsOfComputer[randomIndex].assignedValue
    
    return handOfComputer
}

func playGame(handOfUser: Int, handOfComputer: Int) {
    let pointToWin: [RockPaperScissors: RockPaperScissors] = [.scissor: .paper,
                                                                .rock: .scissor,
                                                                .paper: .rock]
    
    guard let definedValue = RockPaperScissors(rawValue: handOfUser) ,
          let matchedWin = pointToWin[definedValue]?.assignedValue else {
        return
    }
    if matchedWin == handOfComputer {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

func isDraw(handOfUser: Int, handOfComputer: Int) -> Bool {
    if handOfUser == handOfComputer {
        print("비겼습니다!")
        return true
    }
    return false
}

func isRestartGame(handOfUser: Int, handOfComputer: Int) -> Bool {
    var isRestart: Bool = false
    let exit = 0
    let run = 1...3
    
    switch handOfUser {
    case exit :
        print("게임 종료")
        isRestart = false
    case run : isDraw(handOfUser: handOfUser, handOfComputer: handOfComputer) ?
            isRestart = true :
            playGame(handOfUser: handOfUser, handOfComputer: handOfComputer)
    default :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        isRestart = true
    }
    return isRestart
}

func startGame() {
    var isRestart: Bool = false
    let handOfUser = getUserInput()

    let handOfComputer = generateRandomNumber()
    isRestart = isRestartGame(handOfUser: handOfUser, handOfComputer: handOfComputer)
    
    if isRestart {
        startGame()
    }
}

startGame()
