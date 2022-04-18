import Foundation

enum RPS: Int {
    case rock
    case paper
    case scissors
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

