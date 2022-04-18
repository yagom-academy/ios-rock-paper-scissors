import Foundation

enum RPS: Int {
    case rock
    case paper
    case scissors
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
    } else {
        print("게임 종료")
    }
}

startMenu()
