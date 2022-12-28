//
//  gameCheckFunction.swift
//  RockPaperScissors
//
//  Created by 천승현 on 2022/12/27.
//

func checkRockScissorsPaperResult(userNumber: Int, with computerChoice: RockScissorsPaperType) -> RockScissorsPaperScenario {
    let userChoice = convertChoiceToRockScissorsPaper(userChoice: userNumber)
    let userScenario = compare(userChoice: userChoice, with: computerChoice)
    printResult(userScenario)
    return userScenario
}

func convertChoiceToRockScissorsPaper(userChoice: Int) -> RockScissorsPaperType {
    switch userChoice {
    case 1:
        return RockScissorsPaperType.rock
    case 2:
        return RockScissorsPaperType.scissors
    default:
        return RockScissorsPaperType.paper
    }
}

func compare(userChoice: RockScissorsPaperType, with computerChoice: RockScissorsPaperType) -> RockScissorsPaperScenario {
    if userChoice == computerChoice {
        return .draw
    }
    return isUserWin(userChoice: userChoice, with: computerChoice) ? .userWin : .userLose
}

func isUserWin(userChoice: RockScissorsPaperType, with computerChoice: RockScissorsPaperType) -> Bool {
    if (userChoice == .rock && computerChoice == .scissors) ||
        (userChoice == .paper && computerChoice == .rock) ||
        (userChoice == .scissors && computerChoice == .paper) {
        return true
    }
    return false
}

func printResult(_ scenario: RockScissorsPaperScenario) {
    switch scenario {
    case .userWin:
        print("이겼습니다.")
    case .userLose:
        print("졌습니다.")
    case .draw:
        print("비겼습니다.")
    }
}
