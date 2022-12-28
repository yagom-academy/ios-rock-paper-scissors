//
//  rockScissorPapaerFunction.swift
//  RockPaperScissors
//
//  Created by 천승현 on 2022/12/28.
//

var isGameEnd = false
var previousWinner: PreviousType = .user

func playRockScissorsPaper() {
    while !isGameEnd {
        var computerChoice = createRandomRockScissorsPaper()
        printRockScissorsPaper()
        
        let rockScissorsPaperResult = choiceRockScissorsPaper(errorType: .invalidRockScissorsPaper)
        switch rockScissorsPaperResult {
        case .success(let userNumber):
            if isGameEnd(userNumber: userNumber) {
                print("게임 종료")
                isGameEnd = true
                break
            }
            
            var userChoice = convertChoiceToRockScissorsPaper(userChoice: userNumber)
            let userScenario = checkRockScissorsPaperResult(userChoice: userChoice, with: computerChoice)
            if userScenario == .draw {
                break
            }
            
            previousWinner = checkWinner(scenario: userScenario)
            
            while !isGameEnd {
                playMukjippa(&userChoice, with: &computerChoice)
            }
        case .failure(_):
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func checkRockScissorsPaperResult(userChoice: RockScissorsPaperType, with computerChoice: RockScissorsPaperType) -> RockScissorsPaperScenario {
    let userScenario = compare(userChoice: userChoice, with: computerChoice)
    printResult(userScenario)
    return userScenario
}

func convertChoiceToRockScissorsPaper(userChoice: Int) -> RockScissorsPaperType {
    switch userChoice {
    case 1:
        return RockScissorsPaperType.scissors
    case 2:
        return RockScissorsPaperType.rock
    default:
        return RockScissorsPaperType.paper
    }
}

func compare(userChoice: RockScissorsPaperType, with computerChoice: RockScissorsPaperType) -> RockScissorsPaperScenario {
    if userChoice == computerChoice {
        return .draw
    }
    return isUserWin(userChoice, with: computerChoice) ? .userWin : .userLose
}

func isUserWin(_ userChoice: RockScissorsPaperType, with computerChoice: RockScissorsPaperType) -> Bool {
    if (userChoice == .rock && computerChoice == .scissors) ||
        (userChoice == .paper && computerChoice == .rock) ||
        (userChoice == .scissors && computerChoice == .paper) {
        return true
    }
    return false
}

func createRandomRockScissorsPaper() -> RockScissorsPaperType {
    let choice = RockScissorsPaperType(rawValue: Int.random(in: 1...3))
    guard let randomChoice = choice else {
        return createRandomRockScissorsPaper()
    }
    return randomChoice
}

func checkWinner(scenario: RockScissorsPaperScenario) -> PreviousType {
    scenario == .userWin ? .user : .computer
}

func isGameEnd(userNumber: Int) -> Bool {
    return userNumber == 0 ? true : false
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

func printRockScissorsPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}
