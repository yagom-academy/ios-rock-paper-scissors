//
//  RockPaperScissors - main.swift
//  Created by 혜모리, 무리 on 2022.12.26
//

enum RockPaperScissors: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}

func choiceRockPaperScissors() -> Int? {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let userInput = readLine(), userInput != "" else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return choiceRockPaperScissors()
    }

    return Int(userInput)
}

func checkRockPaperScissors(number: Int?) -> Int {
    guard let rockPaperScissorsNumber = number,
            rockPaperScissorsNumber >= 0,
            rockPaperScissorsNumber <= 3
    else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return checkRockPaperScissors(number: choiceRockPaperScissors())
    }
    
    return rockPaperScissorsNumber
}

func createComputerRockPaperScissors() -> Int {
    let computerNumber = Int.random(in: 1...3)
    
    return computerNumber
}

func compareRockPaperScissors(computers: Int, users: Int) {
    let scissor: Int = RockPaperScissors.scissor.rawValue
    let rock: Int = RockPaperScissors.rock.rawValue
    let paper: Int = RockPaperScissors.paper.rawValue
    let computerUserRockPaperScissors: (Int, Int) = (computers, users)
    
    switch computerUserRockPaperScissors {
    case (scissor, scissor), (rock, rock), (paper, paper):
        print("비겼습니다!")
        playRockPaperScissors()
    case (scissor, rock), (rock, paper), (paper, scissor):
        print("이겼습니다!")
    case (rock, scissor), (paper, rock), (scissor, paper):
        print("졌습니다!")
    default:
        print("게임 종료")
    }
}

func playRockPaperScissors() {
    let computerRockPaperScissors = createComputerRockPaperScissors()
    let userRockPaperScissors = checkRockPaperScissors(number: choiceRockPaperScissors())
    
    compareRockPaperScissors(computers: computerRockPaperScissors, users: userRockPaperScissors)
}

playRockPaperScissors()
