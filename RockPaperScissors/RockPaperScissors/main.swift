enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum guidanceMessage {
    static let win = "이겼습니다!\n게임종료"
    static let draw = "비겼습니다!"
    static let lose = "졌습니다!\n게임종료"
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    if let choicedMenu = readLine() {
        playGame(number: choicedMenu)
    }
}

func playGame(number: String) {
    guard number != "0" else {
        print("게임 종료")
        return
    }
    
    guard let myHandDesign: RPS = obtainUserHandDesign(number: number) else {
        startGame()
        return
    }
    
    guard let computerHandDesign: RPS = obtainComputerHandDesign() else {
        startGame()
        return
    }
    compare(myHandDesign: myHandDesign, computerHandDesign: computerHandDesign)
}

func obtainUserHandDesign(number: String) -> RPS? {
    switch number {
    case "1":
        return RPS.scissors
    case "2":
        return RPS.rock
    case "3":
        return RPS.paper
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
}

func obtainComputerHandDesign() -> RPS? {
    guard let computerHandDesign: RPS = RPS(rawValue: Int.random(in: 1...3)) else {
        print("컴퓨터의 값을 얻어오지 못했습니다.")
        return nil
    }
    return computerHandDesign
}

func compare(myHandDesign: RPS, computerHandDesign: RPS) {
    if myHandDesign == computerHandDesign {
        print(guidanceMessage.draw)
        startGame()
    } else if myHandDesign == RPS.rock && computerHandDesign == RPS.scissors ||
                myHandDesign == RPS.scissors && computerHandDesign == RPS.paper ||
                myHandDesign == RPS.paper && computerHandDesign == RPS.rock {
        print(guidanceMessage.win)
    } else {
        print(guidanceMessage.lose)
    }
}

startGame()
