//
//  RockPaperScissors - ResultOfRockPaperScissors.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

//func compareRockPaperScissors(computers: Int, users: Int) {
//    let scissor: Int = RockPaperScissors.scissor.rawValue
//    let rock: Int = RockPaperScissors.rock.rawValue
//    let paper: Int = RockPaperScissors.paper.rawValue
//    let computerUserRockPaperScissors: (Int, Int) = (computers, users)
//
//    switch computerUserRockPaperScissors {
//    case (scissor, scissor), (rock, rock), (paper, paper):
//        print("비겼습니다!")
//        playRockPaperScissors()
//    case (scissor, rock), (rock, paper), (paper, scissor):
//        print("이겼습니다!")
//    case (rock, scissor), (paper, rock), (scissor, paper):
//        print("졌습니다!")
//    default:
//        print("게임 종료")
//    }
//}
//
//func playRockPaperScissors() {
//    let computerRockPaperScissors = createComputerRockPaperScissors()
//    let userRockPaperScissors = createUserRockPaperScissors()
//
//    compareRockPaperScissors(computers: computerRockPaperScissors, users: userRockPaperScissors)
//}

func compareRockPaperScissors(computers: RockPaperScissors, users: RockPaperScissors) {
    let computerUserRockPaperScissors: (RockPaperScissors, RockPaperScissors) = (computers, users)
    
    switch computerUserRockPaperScissors {
    case (.scissor, .scissor), (.rock, .rock), (.paper, .paper):
        print("비겼습니다!")
        playRockPaperScissors()
    case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
        print("이겼습니다!")
    case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
        print("졌습니다!")
    }
}

func playRockPaperScissors() {
    guard let computerRockPaperScissors = convertEnumType(createComputerRockPaperScissors()) ,
    let userRockPaperScissors = convertEnumType(createUserRockPaperScissors()) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return playRockPaperScissors()
    }

    
    compareRockPaperScissors(computers: computerRockPaperScissors, users: userRockPaperScissors)
}
