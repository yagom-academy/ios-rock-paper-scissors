import Foundation

enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case none = -1
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    if let choicedMenu = readLine() {
        operateGame(number: choicedMenu)
    }
}

func operateGame(number: String) {
    var myChoice: RPS = RPS.none
    let computerChoice: RPS = obtainComputerValue()
    switch number {
    case "1":
        myChoice = RPS.scissors
    case "2":
        myChoice = RPS.rock
    case "3":
        myChoice = RPS.paper
    case "0":
        print("게임 종료")
        return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
        return
    }
    compare(myChoice: myChoice, computerChoice: computerChoice)
}

func obtainComputerValue() -> RPS {
    guard let computerChoice: RPS = RPS(rawValue: Int.random(in: 1...3)) else {
        print("컴퓨터의 값을 얻어오지 못했습니다.")
        return RPS.none
    }
    return computerChoice
}

func compare(myChoice: RPS, computerChoice: RPS) {
    if myChoice == computerChoice {
        print("비겼습니다!")
        startGame()
    } else if myChoice == RPS.rock && computerChoice == RPS.scissors ||
                myChoice == RPS.scissors && computerChoice == RPS.paper ||
                myChoice == RPS.paper && computerChoice == RPS.rock {
        print("이겼습니다!\n게임종료")
    } else {
        print("졌습니다!\n게임종료")
    }
}

startGame()
