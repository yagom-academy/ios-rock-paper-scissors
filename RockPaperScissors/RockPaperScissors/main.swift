//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

private func showGameMenu() {
    var isStart = true
    while isStart {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        isStart = getUserInput()
    }
}

private func exitGame() {
    print("게임 종료")
}

private func getUserInput() -> Bool {
    let inputMenuNumber = readLine() ?? ""
        switch inputMenuNumber {
        case "1", "2", "3" :
            let rockPaperScissors = makeRandomNumber()
            return comparePlayerInputAndComputerNumber(userInput: inputMenuNumber, computerNumber: rockPaperScissors)
        case "0" :
            exitGame()
            return false
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return true
        }
}

private func makeRandomNumber() -> String {
    return String(Int.random(in: 1...3))
}

private func comparePlayerInputAndComputerNumber(userInput: String, computerNumber: String) -> Bool {
    // 해당 부분 열거형으로 바꾸는데 사용자 입력값에 따라 열거형 셋팅이 가능한가? 그게 핵심인데 그럼 스위치 케이스로? 패턴에 두개를 넣을 수 있나?
    if computerNumber == "1" && userInput == "2" || computerNumber == "2" && userInput == "3" || computerNumber == "3" && userInput == "1" {
        printResult(result: 1)
        return false
    } else if computerNumber == userInput {
        printResult(result: 0)
    } else {
        printResult(result: 2)
        return false
    }
    return true
}

private func printResult(result: Int) {
    switch result {
    case 0:
        print("비겼습니다!")
    case 1:
        print("이겼습니다!")
        exitGame()
    case 2:
        print("졌습니다!")
        exitGame()
    default:
        break
    }
}

showGameMenu()
