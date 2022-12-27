//
//  RockPaperScissors - ResultOfRockPaperScissors.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

func compareRockPaperScissors(computers: RockPaperScissors, users: RockPaperScissors) -> GameResult {
    let computerUserRockPaperScissors: (RockPaperScissors, RockPaperScissors) = (computers, users)
    
    switch computerUserRockPaperScissors {
    case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
        print(GameResult.draw.description)
        return .draw
    case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
        print(GameResult.win.description)
        return .win
    case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
        print(GameResult.lose.description)
        return .lose
    }
}

func playRockPaperScissors() {
    let computerNumber = createComputerRockPaperScissors()
    let userNumber = createUserRockPaperScissors()
    
    guard userNumber != 0 else {
        return
    }
    
    guard let computerRockPaperScissors = convertEnumType(computerNumber),
    let userRockPaperScissors = convertEnumType(userNumber) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return playRockPaperScissors()
    }
    
    let gameResult = compareRockPaperScissors(computers: computerRockPaperScissors, users: userRockPaperScissors)
    
    if gameResult == .draw {
        playRockPaperScissors()
    }
}
