//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

func getRandomNumber() -> Int {
    return Int.random(in: 1...3)
}


func contendUserAndComputer(_ userChoice: Int, _ computerChoice: Int) -> Bool {
    if (userChoice == 1 && computerChoice == 3) || (userChoice == 2 && computerChoice == 1) || (userChoice == 3 && computerChoice == 2) {
        print("이겼습니다!")
        return true
    } else if userChoice == computerChoice {
        print("비겼습니다!")
        return false
    } else {
        print("졌습니다!")
        return false
    }
}


func playRockPaperScissors() {
    while true {
        let computerChoice = getRandomNumber()
        print("가위(1), 바위(2), 보(3)!<종료: 0> :", terminator: " ")

        guard let input = readLine(), let userChoice = Int(input) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }

        if userChoice >= 1 && userChoice <= 3 {
          let result = contendUserAndComputer(userChoice, computerChoice)
            if result == true {
                break
            } else {
                continue
            }
        } else if userChoice == 0 {
            print("게임종료")
            break
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

playRockPaperScissors()
