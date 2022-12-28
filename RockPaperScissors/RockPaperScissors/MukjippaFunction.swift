//
//  gameCheckFunction.swift
//  RockPaperScissors
//
//  Created by 천승현 on 2022/12/27.
//

func playMukjippa(_ userChoice: inout RockScissorsPaperType, with computerChoice: inout RockScissorsPaperType) {
    printMukjippa(userChoice, with: computerChoice)
    
    let mukjippaResult = choiceRockScissorsPaper(errorType: .invalidMukjippa)
    switch mukjippaResult {
    case .success(let userNumber):
        if isGameEnd(userNumber: userNumber) {
            print("게임 종료")
            return
        }
        
        let randomChoice = createRandomRockScissorsPaper()
        computerChoice = randomChoice
        let userNewChoice = convertChoiceToMukjippa(userChoice: userNumber)
        userChoice = userNewChoice
        
        checkMukjippaResult(userChoice: userChoice, computerChoice: randomChoice)
    case .failure(_):
        changePreviousWinner()
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func checkMukjippaResult(userChoice: RockScissorsPaperType, computerChoice: RockScissorsPaperType) {
    let userScenario = compare(userChoice: userChoice, with: computerChoice)
    if userScenario == .userWin {
        previousWinner = .user
        print("사용자의 턴입니다.")
    } else if userScenario == .userLose {
        previousWinner = .computer
        print("컴퓨터의 턴입니다.")
    } else if userScenario == .draw {
        print("\(previousWinner.rawValue)의 승리!")
        isGameEnd = true
    }
}

func convertChoiceToMukjippa(userChoice: Int) -> RockScissorsPaperType {
    switch userChoice {
    case 1:
        return RockScissorsPaperType.rock
    case 2:
        return RockScissorsPaperType.scissors
    default:
        return RockScissorsPaperType.paper
    }
}

func changePreviousWinner() {
    if previousWinner == .user {
        previousWinner = .computer
    } else {
        previousWinner = .user
    }
}

func printMukjippa(_ userChoice: RockScissorsPaperType, with computerChoice: RockScissorsPaperType) {
    print("[\(previousWinner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: " ")
}
