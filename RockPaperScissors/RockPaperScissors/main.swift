import Foundation

enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case none = -1
}

func startMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    if let choicedMenu = readLine() {
        choiceMenu(number: choicedMenu)
    }
}

func choiceMenu(number: String) {
    var myChoice: RPS = RPS.none
    if number == "1" {
        myChoice = RPS.scissors
    } else if number == "2" {
        myChoice = RPS.rock
    } else if number == "3" {
        myChoice = RPS.paper
    } else if number == "0" {
        print("게임 종료")
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func getComputerNumber() -> RPS {
    guard let computerChoice: RPS = RPS(rawValue: Int.random(in: 1...3)) else {
        print("ERROR getComputerNumber()")
        return RPS.none
    }
    return computerChoice
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
