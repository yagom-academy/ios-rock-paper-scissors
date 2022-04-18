import Foundation

enum RPS: Int {
    case rock = 2
    case paper = 3
    case scissors = 1
}

func startMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    if let choicedMenu = readLine() {
        choiceMenu(number: choicedMenu)
    }
}

func choiceMenu(number: String) {
    if number == "1" {
        RPS.scissors
    } else if number == "2" {
        RPS.rock
    } else if number == "3" {
        RPS.paper
    } else if number == "0" {
        print("게임 종료")
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func getComputerNumber() -> Int {
   let computerRandomNumber = Int.random(in: 1...3)
    return computerRandomNumber
}

func checkUserInput(of: String) {
    guard let userInput = Int(of) else {
        return
    }
    if 0...3 ~= userInput {
    } else {
        print("잘못된 입력입니다.")
        startMenu()
    }
}

startMenu()
